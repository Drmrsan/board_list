class CommentsController < ApplicationController
	before_action :find_board_and_todo
	before_action :find_card
	def new
		@comment = Comment.new
	end

	def create
		@comment = @card.comments.build(comment_params)
		if @comment.save
			redirect_to board_to_do_card_path(@board,@to_do,@card)
		else
			render 'comment'
		end
	end

	def show
		@card = @to_do.cards.find(params[:card_id])
		@comment = @card.comments.find(params[:id])
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)
	end

	def find_board_and_todo
		@board = Board.find(params[:board_id])
		@to_do = @board.to_dos.find(params[:to_do_id])
	end

	def find_card
		@card = @to_do.cards.find(params[:card_id])
	end
end
