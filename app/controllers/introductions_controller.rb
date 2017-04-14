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
            flash[:success] = "Created Organizer Image!"
            redirect_to organizer_url
        else
            render 'new'
        end
    end
    
    def edit
        @introduction = Introduction.find(params[:id])
        @introduction.photo.cache! if @introduction.photo.present? && Rails.env.development?
    end
    
    def update
        @introduction = Introduction.find(params[:id])
        if @introduction.update(introduction_params)
            flash[:notice] = 'Update Organizer Image!'
            redirect_to organizer_url
        else
            render 'edit'
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
