class BoardsController < ApplicationController
	
	before_action :find_board, only: [:show,:destroy,:edit,:update]

	def index
		@boards = Board.all
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.create(board_params)

		if @board.save
			redirect_to boards_path
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
			redirect_to boards_path
		else
			render 'edit'
		end
	end

	private

	def board_params
		params.require(:board).permit(:title)
	end

	def find_board
		@board = Board.find(params[:id])
	end
end
