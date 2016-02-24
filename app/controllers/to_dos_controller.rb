class ToDosController < ApplicationController

	before_action :find_board, only: [:create]

	def create
		@to_do = @board.to_dos.create(todo_params)

		if @to_do.save
			redirect_to @board
		else
			render 'new'
		end
	end

	private

	def todo_params
		params.require(:to_do).permit(:title)
	end

	def find_board
		@board = Board.find(params[:board_id])
	end
end
