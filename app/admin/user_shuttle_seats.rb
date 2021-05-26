ActiveAdmin.register UserShuttleSeat do

    permit_params :seat_no, :shuttle_id, :state, :user_id, :user_shuttle_id
end