class UserShuttleSeat < ApplicationRecord
  belongs_to :user, inverse_of: :user_shuttle_seats
  belongs_to :shuttle, inverse_of: :user_shuttle_seats
  belongs_to :user_shuttle, inverse_of: :user_shuttle_seats

  validates :state, inclusion: { in: [UserShuttle::STATE_ONGOING, UserShuttle::STATE_FINISH],
    message: "%{value} is not a valid state"}
end
