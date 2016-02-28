class Card < ActiveRecord::Base
	belongs_to :user
	belongs_to :to_do
	has_many :comments, dependent: :destroy
end
