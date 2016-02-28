class User < ActiveRecord::Base
	attr_accessor :login
	has_many :boards
	has_many :to_dos
	has_many :cards
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
