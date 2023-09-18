class StudentsController < ApplicationController
    
    before_action :authenticate_user!

   def index
    @mcq=Mcq.all
    @user=User.all
   end
  end
  