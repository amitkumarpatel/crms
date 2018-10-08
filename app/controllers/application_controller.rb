class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_url, alert: exception.message
	end

  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end

	protected

	 def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
	   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
	 end 
end
