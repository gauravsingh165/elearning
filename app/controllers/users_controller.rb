class UsersController < ApplicationController

# def index

# end

#   def show
#    @user=User.find(params[:id])
#   end 
 private


def user_param
  params.require(:user).permit(:email,:password,:role)

end
end
