class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Add custom parameter "username" to devise's User
  # Hack found here: http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password)}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
    end

end
