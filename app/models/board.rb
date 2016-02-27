class Board < ActiveRecord::Base
	has_many :to_dos, dependent: :destroy
	has_many :cards
end
