class EssaysController < ApplicationController
  before_action :set_essay, only: [:show, :edit, :update, :destroy]

  def index
    @essays = Essay.all
    @essay = Essay.new  #// Initialize a new Essay instance for use with Turbo Streams//
  end

  def show
  end

  def new
    authorize! :access, :essay_new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)

    if @essay.save
      respond_to do |format|
        format.html { redirect_to @essay, notice: 'Essay was successfully created.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@essay) }
      end
    else
      render turbo_stream: turbo_stream.replace(@essay), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @essay.update(essay_params)
      respond_to do |format|
        format.html { redirect_to @essay, notice: 'Essay was successfully updated.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@essay) }
      end
    else
      render turbo_stream: turbo_stream.replace(@essay), status: :unprocessable_entity
    end
  end

  def destroy
    @essay.destroy

    respond_to do |format|
      format.html { redirect_to essays_url, notice: 'Essay was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@essay) }
    end
  end

  private

  def set_essay
    @essay = Essay.find(params[:id])
  end

  def essay_params
    params.require(:essay).permit(:question, :answer, :course_id)
  end
end

