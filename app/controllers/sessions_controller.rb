class SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource)
    if ['admin', 'manager', 'tutor'].include? current_user.role
      admin_index_path
    else
      students_url
    end
  end
end