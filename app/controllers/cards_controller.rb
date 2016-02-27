class CardsController < ApplicationController
	
	def new
		@board = Board.find(params[:board_id])
		@to_do = @board.to_dos.find(params[:to_do_id])
		@card = Card.new
	end

	def create
		@board = Board.find(params[:board_id])
		@to_do = @board.to_dos.find(params[:to_do_id])
		@card = @to_do.cards.build(card_params)

		if @card.save
			redirect_to board_path(@board)
		else
			render 'new'
		end
	end

	def show
		@board = Board.find(params[:board_id])
		@to_do = @board.to_dos.find(params[:to_do_id])
		@card = @to_do.cards.find(params[:id])
	end

	private
	def card_params
		params.require(:card).permit(:title)
	end
end
