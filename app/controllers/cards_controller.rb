class CardsController < ApplicationController
	before_action :find_board_and_todo, except: [:destroy]
	before_action :find_card, only: [:show,:edit,:update]
	def new
		@card = Card.new
	end

	def create
		@card = @to_do.cards.build(card_params)

		if @card.save
			redirect_to board_path(@board)
		else
			render 'new'
		end
	end

	def show
		@card = @to_do.cards.find(params[:id])
	end

	def destroy
		@card = Card.find(params[:id])
		@card.destroy
		redirect_to :back
	end

	def edit
	end

	def update
		if @card.update(card_params)
			redirect_to board_to_do_card_path
		else
			render 'edit'
		end
	end

	private
	def card_params
		params.require(:card).permit(:title, :description, :duedate)
	end

	def find_board_and_todo
		@board = Board.find(params[:board_id])
		@to_do = @board.to_dos.find(params[:to_do_id])
	end

	def find_card
		@card = @to_do.cards.find(params[:id])
	end
end