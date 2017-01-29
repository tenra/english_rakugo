class BookingsController < ApplicationController
  before_action :sign_in_required
  
  def create
      #binding.pry
      @event = Event.find(params[:event_id])
    ActiveRecord::Base.transaction do
      if @event.capacity <= @event.booking_users.count
        flash[:alert] = "Sorry, It is fullbooking now."
        redirect_to show_event_path
      else
        @user = current_user
        @booking = current_user.booking(@event)
        @booking.number = @event.created_at.strftime('%Y%m%d%H%M').to_s + @event.id.to_s + @user.id.to_s
        @booking.save
        flash[:notice] = "your booking is completed!"
        EventMailer.received_email(@event, current_user).deliver
        redirect_to users_me_path
      end
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.unbooking(@event)
    flash[:notice] = "Your event has been successfully cancelled!"
    redirect_to users_me_path
  end
end