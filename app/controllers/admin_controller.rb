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
    @events = User.find(:all, :confitions => {:user_id => params[:event_id]})
    @events = Event.find(:all, :confitions => {:event_id => params[:event_id]})
    @event = Event.find(params[:event_id])
  end
end
