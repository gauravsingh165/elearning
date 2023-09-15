
class UserDetailsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User details saved successfully!'
    else
      render :new
    end
  end
  def edit
   @user=User.find(params[:id])
  end 
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end
