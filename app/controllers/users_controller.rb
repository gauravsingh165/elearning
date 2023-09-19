class UsersController < ApplicationController

# def index

# end

  # def show
  #  @user=User.find(params[:id])
  # end 
  def admin?
    role == 'admin'
  end
  def manager?
    role == 'manager'
  end
  def tutor?
    role == 'tutor'
  end
  def student?
    role == 'student'
  end

 private

def user_param
  params.require(:user).permit(:email,:password,:role)

end
end
