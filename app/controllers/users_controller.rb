class UsersController < ApplicationController
 private


def user_param
  params.require(:user).permit(:email,:password,:role)

end
end
