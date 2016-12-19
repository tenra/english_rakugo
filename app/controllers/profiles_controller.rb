class ProfilesController < ApplicationController

  def new
      @profile = Profile.new
      @profile = current_user.profile if current_user.profile.present?
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
       flash[:success] = "Created your profile image!"
       redirect_to users_me_url
    else
      render 'new'
    end
  end
  
  def edit
      @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    @profile.user = current_user
    if @profile.update(profile_params)
       flash[:success] = "updated your profile image!"
       redirect_to users_me_url
    else
      render action: 'edit'
    end
  end

  private
  def profile_params
      params.require(:profile).permit(:avatar, :country, :user_id)
  end
end