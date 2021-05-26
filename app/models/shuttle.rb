class Shuttle < ApplicationRecord
    acts_as_paranoid
    has_many :user_shuttles
    has_many :users, through: :user_shuttles
    has_many :shuttle_seats
    has_many :user_shuttle_seats
end
