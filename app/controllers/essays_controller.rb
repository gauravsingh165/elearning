class EssaysController < ApplicationController
    def index
    end
    def new
      @essay = Essay.new
    end
  
    def create
      @essay = Essay.new(essay_params)
      if @essay.save
        redirect_to admin_path
      else
        render 'new'
      end
    end
  
    def show
      @essay = Essay.find(params[:id])
    end
  
    private
  
    def essay_params
      params.require(:essay).permit(:question, :answer)
    end
  end
  