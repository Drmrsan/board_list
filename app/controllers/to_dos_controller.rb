class ToDosController < ApplicationController

	before_action :find_board, only: [:create, :show, :edit, :update]
	before_action :find_todo, only: [:show, :edit, :update]


	def create
		@to_do = @board.to_dos.create(todo_params)

		if @to_do.save
			redirect_to @board, notice: "ToDo is succesfully created!"
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
			redirect_to @board, notice: "ToDo is succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@to_do = ToDo.find(params[:id])
		@to_do.destroy
		redirect_to :back, notice: "ToDo is succesfully deleted!"
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
