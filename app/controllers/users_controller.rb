class UsersController < ApplicationController
    #before_action :authenticate_user!
  
  def me
      @users = User.all
      @profiles = Profile.all
  end
  
  def show
    @user = User.find(params[:user_id])
  end
  
end
