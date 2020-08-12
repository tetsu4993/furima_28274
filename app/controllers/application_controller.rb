class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?



  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'shibuya' && password == '4993'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :family_name, :first_name, :family_name_kana, :first_name_kana])
  end

end