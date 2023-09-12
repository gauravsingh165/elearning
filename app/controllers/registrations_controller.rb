class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
   
    if user.role == "admin"
      admin_index_path
    else
      admins_path
    end
    
  end
end
