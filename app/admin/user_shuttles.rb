ActiveAdmin.register UserShuttle do

    permit_params :started_at, :ends_at, :no_of_seats, :state, :user_payment_status, :user_payment, :user_id, :shuttle_id
end
  