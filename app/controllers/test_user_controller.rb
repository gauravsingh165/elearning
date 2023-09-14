class TestUserController < ApplicationController
    before_action :set 
    def index
    end
    def new
     @user =User.new
    end
    def create
        @user = User.new(user_params) 
        if @user.save
          redirect_to @user
        else
          render 'new'
        end
      end
    def set
        @test=true
    end
    private
    def user_param
      params.require(:user).permit(:email)
    end 
end
