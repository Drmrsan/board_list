class Board < ActiveRecord::Base
	has_many :to_dos
	has_many :cards, through: :to_dos
end
