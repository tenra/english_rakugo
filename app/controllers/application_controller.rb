class ApplicationController < ActionController::Base
  include AdminsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :store_location
  
  def store_location
    if (request.fullpath != new_user_registration_path &&
        request.fullpath != new_user_session_path &&
        request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end
  
    def after_sign_in_path_for(resource)
      if (session[:previous_url] == users_me_path)
        super
      else
        session[:previous_url] || users_me_path
      end
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
