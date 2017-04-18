class UsersController < ApplicationController
   before_action :sign_in_required
   #before_action :admin_check, only: [:show, :destroy]
   before_action :organizer_check, only: [:show, :organizer, :blogs, :destroy]
   #before_action :authenticate_user!
  
  def me
      @users = User.all
      @profiles = Profile.all
  end
  
  def show
    @user = User.find(params[:user_id])
    @booking = current_user.booking(@event)
  end
  
  def organizer
  end
  
  def blogs
  end
  
  def elses
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'It has been successfully cancelled.'
    redirect_to admin_users_url
  end

end
