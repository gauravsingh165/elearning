class TextbookController < ApplicationController
  def index
    @textbook=Textbook.all  
  end

  def new
    @textbook=Textbook.new
  end

  def edit
  end

  def create
    @textbook=Textbook.find(textbook_params)
    if @textbook.save
      redirect_to textbook_path 
    else
      render "new"
  end
  def update
    
  end
  def destroy
  end

  def show
  end
end
