class AdminController < ApplicationController
  before_action :admin_check
    
  def users
   @users = User.all 
   @page_title = 'Users'
  end
  
  def events
    @events = Event.all
  end
  
  def participants
    @event = Event.find(params[:event_id])
    @booking_users =  @event.booking_users
  end
end
