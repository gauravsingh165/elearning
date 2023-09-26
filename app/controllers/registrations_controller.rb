class RegistrationsController < Devise::RegistrationsController
  # skip_before_action :require_no_authentication, only: [:new, :create]


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
   private

   def user_params
     params.require(:user).permit(:email, :password, :role) # Adjust the permitted attributes as needed
   end
end
