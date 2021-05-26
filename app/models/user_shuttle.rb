class UserShuttle < ApplicationRecord
  belongs_to :user, inverse_of: :user_shuttles
  belongs_to :shuttle, inverse_of: :user_shuttles
  has_many :user_shuttle_seats, dependent: :destroy, inverse_of: :user_shuttle

  after_update do 
    self.user_shuttle_seats.update_all(state: UserShuttle::STATE_FINISH) if self.state == UserShuttle::STATE_FINISH
  end


  STATE_ONGOING = 'ongoing'
  STATE_REQUEST = 'Requested'
  STATE_FINISH = 'Finished'
  STATE_NOT_PAIED = 'not paied'
  STATE_PAIED = 'paied'

  # ### VALIDATION ###

  # validates :call_duration, :numericality => { :greater_than_or_equal_to => 0 }
  validates :state, inclusion: { in: [UserShuttle::STATE_ONGOING, UserShuttle::STATE_REQUEST, UserShuttle::STATE_FINISH],
                                  message: "%{value} is not a valid state"}
  validates :user_payment_status, inclusion: { in: [UserShuttle::STATE_NOT_PAIED, UserShuttle::STATE_PAIED],
                                  message: "%{value} is not a valid state"}

  def get_available_seat_no
    if no_of_seats <= (self.shuttle.totel_seats - self.shuttle.user_shuttle_seats.where(state: UserShuttle::STATE_ONGOING).count)
      available_seat = shuttle.shuttle_seats.where.not(seat_no: shuttle.user_shuttle_seats.where(state: UserShuttle::STATE_ONGOING).pluck(:seat_no)).limit(no_of_seats)
      available_seat.each do |seat|
        self.user_shuttle_seats.create(seat_no: seat.seat_no, shuttle_id: shuttle.id, user_id: user.id, state: UserShuttle::STATE_ONGOING)
      end
    end  
  end
  
  def is_seats_avalible?
    self.no_of_seats <= (self.shuttle.totel_seats - self.shuttle.user_shuttle_seats.where(state: UserShuttle::STATE_ONGOING).count)
  end

  def get_user_payment
    shuttle.payment_per_passenger * no_of_seats
  end
end
