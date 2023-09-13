class StudentsController < ApplicationController
    before_action :authenticate_user!

   def index
    @mcq=Mcq.all
   end
  end
  