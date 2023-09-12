class ApplicationController < ActionController::Base


    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,:role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password,:role])
  end
end
