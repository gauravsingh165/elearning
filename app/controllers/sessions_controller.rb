class SessionsController < Devise::SessionsController
     protected
     def after_sign_in_path_for(current_user)
      if current_user.role=='admin'
        admin_index_path
      elsif current_user.role == "manager"
        admin_index_path
      elsif current_user.role =="tutor"
        admin_index_path
      else
        students_url
      end
    end
end