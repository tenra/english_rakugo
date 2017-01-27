class BookingsController < ApplicationController
  before_action :sign_in_required
  
  def create
    #binding.pry
    @event = Event.find(params[:event_id])
    @user = current_user
    @booking = current_user.booking(@event)
    @booking.number = @event.created_at.strftime('%Y%m%d%H%M').to_s + @event.id.to_s + @user.id.to_s
    @booking.save
    flash[:success] = "your booking is completed!"
    EventMailer.received_email(@event).deliver
    redirect_to users_me_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.unbooking(@event)
    redirect_to show_event_path(@event)
  end
end