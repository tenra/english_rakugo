class ProfilesController < ApplicationController
    

  def new
      @profile = current_user.build_profile
  end

　def create
    @profile = current_user.build_profile(params[:id])
    if @event.save
       flash[:success] = "Created your profile image!"
       redirect_to @profile
    else
      render 'new'
    end
  end

private
    def profile_params
      params.require(:profile).permit(
      :avatar, :country, :user_id
        )
    end

end
