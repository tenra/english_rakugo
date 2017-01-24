class BookingsController < ApplicationController
  before_action :sign_in_required
  
  def create
    @event = Event.find(params[:event_id])
    current_user.booking(@event)
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