class ShuttleSeat < ApplicationRecord
  belongs_to :shuttle, inverse_of: :shuttle_seats
end
