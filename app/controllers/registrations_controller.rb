class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
   
    if user.role == "admin"
      admin_index_path
    elsif user.role == "manager"
      admin_index_path
    elsif user.role =="tutor"
      admin_index_path
    else
      students_url
    end
   end
end
