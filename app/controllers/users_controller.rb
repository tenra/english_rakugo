class UsersController < ApplicationController
    #before_action :authenticate_user!
  
  def me
      @users = User.all
      @profiles = Profile.all
  end
  
  def show
    @user = User.find(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'It has been successfully cancelled.'
    redirect_to admin_users_url
  end

end
