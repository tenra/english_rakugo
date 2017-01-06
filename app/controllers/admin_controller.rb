class AdminController < ApplicationController
  before_action :admin_check
    
  def users
   @users = User.all 
   @page_title = 'Users'
  end
  
  def events
    @events = Event.all
  end
end
