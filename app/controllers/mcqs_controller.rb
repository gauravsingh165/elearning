# app/controllers/mcqs_controller.rb
class McqsController < ApplicationController
  load_and_authorize_resource
  def index
    @mcqs = Mcq.all
    @user=User.all
    @mcq = Mcq.new
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not authorized to access this page."
    redirect_to root_url
  end
  def new
    @mcq = Mcq.new
  end
  
  def create
    @mcq = Mcq.new(mcq_params)
  
    if @mcq.save
      redirect_to mcqs_path
    else
      puts @mcq.errors.full_messages # Add this line to see validation errors in the console
      render 'new'
    end
  end
  def update
    @mcq = Mcq.find(params[:id])
      if @mcq.update(mcq_params)
        if @mcq.correct_option == @mcq.given_answer  
          redirect_to mcq_path(@mcq), notice: 'MCQ was successfully updated.'
        else
          render 'new'
      end
    end
  end
  def show
    @mcq = Mcq.find(params[:id])
  end
  
    private
  
    def mcq_params
      params.require(:mcq).permit(:question, :option1, :option2, :option3, :option4, :correct_option, :course_id,:given_answer)
    end
    
end
  