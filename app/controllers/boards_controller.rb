class BoardsController < ApplicationController
	before_action :find_board, only: [:show,:destroy,:edit,:update]

	def index
		@home_page = true
		@boards = Board.all
		@to_do = ToDo.all
		@cards = Card.all
	end

	def new
		@board = current_user.boards.build
	end

	def create
		@board = current_user.boards.create(board_params)
		@board.user_id = current_user.id
		if @board.save
			redirect_to boards_path, notice: "Board is succesfully created!"
		else
			render 'new'
		end
				
	end

	def show
	end

	def edit
	end

	def update
		if @board.update(board_params)
			redirect_to boards_path, notice: "Board is succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@board.destroy
		redirect_to boards_path, notice: "Board is succesfully deleted!"
	end

	private

	def board_params
		params.require(:board).permit(:title)
	end

	def find_board
		@board = Board.find(params[:id])
	end
end
