class EssaysController < ApplicationController
  before_action :set_essay, only: [:show, :edit, :update, :destroy]

  def index
    @essays = Essay.all 
    @essay = Essay.new  
  end

  def show
  end

  def new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)

    if @essay.save
      redirect_to @essay, notice: 'Essay was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @essay.update(essay_params)
      redirect_to @essay, notice: 'Essay was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @essay.destroy
    redirect_to essays_url, notice: 'Essay was successfully destroyed.'
  end

  private

  def set_essay
    @essay = Essay.find(params[:id])
  end

  def essay_params
    params.require(:essay).permit(:question, :answer, :course_id)
  end
end
