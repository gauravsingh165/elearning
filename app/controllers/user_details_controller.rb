class UserDetailsController < ApplicationController
  def index
  @users=User.all
  @user = User.new

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
  def edit
   @user=User.find(params[:id])
  end 
  def update
    @user=User.find(params[:id])

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to @user, notice: 'Essay was successfully updated.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@user) }
      end
    else
      render turbo_stream: turbo_stream.replace(@user), status: :unprocessable_entity
    end
  end
  
  def show
    @user=User.find(params[:id])
  end 
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Essay was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@user) }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end

# class UserDetailsController < ApplicationController
#   def index
#   @users=User.all
#   end

#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(user_params)

#     if @user.save
#       redirect_to admin_index_path, notice: 'User details saved successfully!'
#     else
#       render :new
#     end
#   end
#   def edit
#    @user=User.find(params[:id].to_i)
#   end 
#   def update
#     @user=User.find(params[:id].to_i)

#     if @user.update(user_params)
#       redirect_to admin_index_path, notice: 'User was successfully updated.'
#     else
#       render :edit
#     end
    
#   end
  
#   def show
#     @user=User.find(params[:id].to_i)
#   end 
#   def destroy
#     @user=User.find(params[:id].to_i)
#     @user.destroy
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password, :role)
#   end
# end


