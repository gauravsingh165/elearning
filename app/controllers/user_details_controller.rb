class UserDetailsController < ApplicationController
  def index
  @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_index_path, notice: 'User details saved successfully!'
    else
      render :new
    end
  end
  def edit
   @user=User.find(params[:id].to_i)
  end 
  def update
    @user=User.find(params[:id].to_i)

    if @user.update(user_params)
      redirect_to admin_index_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
    
  end
  
  def show
    @user=User.find(params[:id].to_i)
  end 
  def destroy
    @user=User.find(params[:id].to_i)
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end