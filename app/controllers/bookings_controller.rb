class BookingsController < ApplicationController
  before_action :sign_in_required
  
  def create
    @event = Event.find(params[:event_id])
    current_user.booking(@event)
    flash[:success] = "your booking is completed!"
    redirect_to users_me_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.unbooking(@event)
    #redirect_to @event
  end
end