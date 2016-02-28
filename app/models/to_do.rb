class ToDo < ActiveRecord::Base
	belongs_to :user
	belongs_to :board
	has_many :cards, dependent: :destroy
end
