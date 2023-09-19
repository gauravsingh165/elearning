
class UserDetailsController < ApplicationController
  def index
    if params[:search]
      @users = User.where("email LIKE ?", "%#{params[:search]}%").where.not(id: current_user.id)
    else
      @users = User.all.where.not(id: current_user.id)
    end
  
  end

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
  def show
    @user=User.find(params[:id])

    respond_to do |format|
      format.turbo_stream
    end
  end 
  def destroy
    @user=User.find(params[:id])
    @user.destroy


  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end
