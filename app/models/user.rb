class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  has_many :user_shuttles, inverse_of: :user
  has_many :shuttles, through: :user_shuttles
  has_many :user_shuttle_seats, inverse_of: :user
end
