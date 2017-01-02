class AdminController < ApplicationController
    
    def users
       @users = User.all 
    end
    
    def events
        @events = Event.all
    end

end
