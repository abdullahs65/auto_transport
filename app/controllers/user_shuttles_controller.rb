class UserShuttlesController < ApplicationController
    before_action :set_user_shuttle, only: [:edit, :update, :destroy, :check_in, :check_out, :calculate_payment]
 
    def create
      @user_shuttle = UserShuttle.new(user_shuttle_params)
      if @user_shuttle.is_seats_avalible?
        @user_shuttle.get_available_seat_no
        @user_shuttle.state = UserShuttle::STATE_REQUEST
        @user_shuttle.user_payment_status = UserShuttle::STATE_NOT_PAIED
        if @user_shuttle.save!
          respond_to do |format|  
            format.json do
              format.json { render json: @user_shuttle.user_shuttle_seats}
            end
          end
        else
          respond_to do |format|  
            format.json do
              render json: { errors: @user_shuttle.errors.full_messages},status: :bad_request   
            end
          end
        end 
      else
        respond_to do |format|  
            format.json do
              render json: { errors: ['Sorry! no Seats Avalible']},status: :bad_request   
            end
          end
      end  
    end    

    def check_in
      if @user_shuttle.update(started_at: DateTime.now, state: UserShuttle::STATE_ONGOING)
        respond_to do |format|  
          format.json do
            render json: {success: "successfully submitted"}, status: 200 
          end
        end
      else
        respond_to do |format|  
          format.json do
            render json: { errors: @user_shuttle.errors.full_messages},status: :bad_request   
          end
        end
      end 
    end

    def calculate_payment
      respond_to do |format|  
        format.json do
          render json: {success: @user_shuttle.get_user_payment}, status: 200 
        end
      end
    end   
    
    def check_out
      if @user_shuttle.update(ends_at: DateTime.now, state: UserShuttle::STATE_FINISH, user_payment_status: UserShuttle::STATE_PAIED)
        respond_to do |format|  
          format.json do
            render json: {success: "successfully submitted"}, status: 200
          end
        end
      else
        respond_to do |format|  
          format.json do
            render json: { errors: @user_shuttle.errors.full_messages},status: :bad_request   
          end
        end
      end 
    end 
    
    def set_user_shuttle
        @user_shuttle = UserShuttle.find(params[:id])
    end  
    
    private
    def user_shuttle_params
        params.require(:user_shuttle).permit(:shuttle_id, :user_id, :started_at, :ends_at, :no_of_seats
        )
    end
end
