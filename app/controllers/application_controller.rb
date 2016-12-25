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
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end
  
  # サブドメインからlocaleを取得する
  # 有効なlocaleが見つからない場合は、nilを返す
  def extract_locale_from_tld
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
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
