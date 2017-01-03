class UsersController < ApplicationController
    #before_action :authenticate_user!
  
  def me
      @users = User.all
      @profiles = Profile.all
  end
  
end
