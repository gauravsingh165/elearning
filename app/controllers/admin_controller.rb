class AdminController < ApplicationController
  before_action :authenticate_user!
   def index
    @users = User.all
    @courses = Course.all
    @mcqs = Mcq.all

   end
   def show
    @mcq = Mcq.find(params[:id])

   end
end
