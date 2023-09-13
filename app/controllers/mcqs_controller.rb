# app/controllers/mcqs_controller.rb
class McqsController < ApplicationController
  def index
    @mcqs = Mcq.all
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
  
  def show
    @mcq = Mcq.find(params[:id])
  end
  
    private
  
    def mcq_params
      params.require(:mcq).permit(:question, :option1, :option2, :option3, :option4, :correct_option, :course_id)
    end
    
end
  