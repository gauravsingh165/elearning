class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user  
 

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  # Load the ability class
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  private
  def set_current_user
    @current_user = current_user
  end

  def after_sign_in_path_for(resource)
    if ['admin', 'manager', 'tutor'].include? current_user.role
      admin_index_path
    else
      students_url
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password)}
  end
end
