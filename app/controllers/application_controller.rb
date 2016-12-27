class ApplicationController < ActionController::Base
  include AdminsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    def after_sign_in_path_for(resource)
        users_me_path
    end

  before_action :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

        
  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  
  private
    def sign_in_required
       unless user_signed_in?
        redirect_to new_user_session_url
        flash[:alert] = "you need to sign up before you booking"
       end
    end
        
end
