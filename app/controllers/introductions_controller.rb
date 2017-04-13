class IntroductionsController < ApplicationController
    before_action :sign_in_required
    before_action :organizer_check
    before_action :already_build, only: [:new]
    
    def new
        @introduction = Introduction.new
    end
    
    def create
        @introduction = Introduction.new(introduction_params)
        @introduction.user = current_user
        if @introduction.save
            flash[:success] = "Created your Introduction Photo!"
            redirect_to organizer_url
        else
            render 'new'
        end
    end
    
    private
    def introduction_params
        params.require(:introduction).permit(:photo, :photo_cache, :name, :sentence)
    end
    
    def already_build
        redirect_to edit_introduction_path(current_user.introduction) if current_user.introduction
    end        
end
