class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    def after_sign_in_path_for(resource)
        users_show_path
    end

        
  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  
  private
    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end
        
end
