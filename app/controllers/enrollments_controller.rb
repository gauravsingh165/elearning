class EnrollmentsController < ApplicationController
    before_action :authenticate_user!

    def new
      @enrollment = Enrollment.new
    end
  
    def create
      @enrollment = Enrollment.new(enrollment_params)
      if @enrollment.save
        redirect_to @enrollment.course, notice: 'Enrollment was successful.'
      else
        render :new
      end
    end
  
    def destroy
      @enrollment = Enrollment.find(params[:id])
      @enrollment.destroy
      redirect_to @enrollment.course, notice: 'Enrollment was removed.'
    end
  
    private
  
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :course_id,:progress)
    end
end
