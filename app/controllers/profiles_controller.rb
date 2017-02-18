class ProfilesController < ApplicationController
  before_action :already_build, only: [:new]

  def new
    @profile = Profile.new
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
    #binding.pry
    @profile = Profile.find(params[:id])
    @profile.avatar.cache! if @profile.avatar.present?
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "updated your profile image!"
      redirect_to users_me_url
    else
      render 'edit'
    end
  end

  private
  def profile_params
      params.require(:profile).permit(:avatar, :country, :avatar_cache, :private)
  end
  
  def already_build
    redirect_to edit_profile_path(current_user.profile) if current_user.profile
  end
end