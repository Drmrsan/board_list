class ToDo < ActiveRecord::Base
	belongs_to :board
	has_many :cards
end
