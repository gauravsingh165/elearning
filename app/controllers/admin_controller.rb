class AdminController < ApplicationController
  
  before_action :authenticate_user!
   def index
    authorize! :access, :admin_panel 
    @users = User.all
    @courses = Course.all
    @mcqs = Mcq.all

   end
   def new
     @user=User.new
   end
   def show
    @mcq = Mcq.find(params[:id])

   end
end
