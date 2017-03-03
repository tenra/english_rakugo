class UsersController < ApplicationController
    #before_action :authenticate_user!
  
  def me
      @users = User.all
      @profiles = Profile.all
  end
  
  def show
    @user = User.find(params[:user_id])
    @booking = current_user.booking(@event)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'It has been successfully cancelled.'
    redirect_to admin_users_url
  end

end
