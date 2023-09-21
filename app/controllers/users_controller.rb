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



  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      format.html { redirect_to @user, notice: "user was created successfully" }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@user) }
    else
      render turbo_stream: turbo_stream.replace(@user), status: :unprocessable_entity
    end
    
  end

  def destroy
    @user = User.find_by(id: params[:id]) # Attempt to find the user by ID
    if @user
      @user.destroy
      redirect_to users_path, notice: "User was successfully deleted."
    else
      redirect_to users_path, alert: "User not found." # Or handle the error in another way
    end
  end
  def edit
    @user=User.find(params[:id])
   end 

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Essay was successfully updated.' }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@user) }
    end
  else
    render turbo_stream: turbo_stream.replace(@user), status: :unprocessable_entity
  end
end

private

def user_params
  params.require(:user).permit(:email, :password, :role) # Adjust the permitted attributes as needed
end
end

