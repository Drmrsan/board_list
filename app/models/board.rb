class Board < ActiveRecord::Base
	belongs_to :user
	has_many :to_dos, dependent: :destroy
	has_many :cards
end
