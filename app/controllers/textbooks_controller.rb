class TextbooksController < ApplicationController
  def index
    @textbook=Textbook.all  
  end

  def new
    @textbook=Textbook.new
  end

  def edit
    @textbook=Textbook.find(params[:id])
  end

  def create
    @textbook=Textbook.new(textbook_params)
    if @textbook.save
      respond_to do |format|
        format.html { redirect_to @textbook, notice: "textbook was created successfully"}
        format.turbo_stream {render turbo_stream: turbo_stream.replace(@textbook)}
      end
    else
      render turbo_stream: turbo_stream.replace(@textbook), status: :unprocessable_entity
    end
  end
  def update
    
  end
  def update
    if @textbook.update(textbook_params)
      respond_to do |format|
        format.html { redirect_to @textbook, notice: 'textbook was successfully updated.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@textbook) }
      end
    else
      render turbo_stream: turbo_stream.replace(@textbook), status: :unprocessable_entity
    end
  end

  def show
    @textbook=Textbook.find(params[:id])
  end
  def destroy
    @textbook.destroy

    respond_to do |format|
      format.html { redirect_to textbook_url, notice: 'Textbook was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@textbook) }
    end
  end

  private 
   def textbook_params
     params.require(:textbook).permit(:course_id,:title,:read)
   end
end
