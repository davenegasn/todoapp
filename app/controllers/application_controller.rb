class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters_signup, if: :devise_controller?
	before_action :configure_permitted_parameters_account_update, if: :devise_controller?

  protected
  
  def configure_permitted_parameters_signup
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
  def configure_permitted_parameters_account_update
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end
end
