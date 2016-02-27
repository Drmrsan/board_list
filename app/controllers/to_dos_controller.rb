class ToDosController < ApplicationController

	before_action :find_board, only: [:create, :show, :edit, :update]
	before_action :find_todo, only: [:show, :edit, :update]


	def create
		@to_do = @board.to_dos.create(todo_params)

		if @to_do.save
			redirect_to @board
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @to_do.update(todo_params)
			redirect_to @board
		else
			render 'edit'
		end
	end

	private

	def todo_params
		params.require(:to_do).permit(:title)
	end

	def find_board
		@board = Board.find(params[:board_id])
	end

	def find_todo
		@to_do = @board.to_dos.find(params[:id])
	end

end
