class ProductLinesController < ApplicationController
  before_action :set_product_line, only: [:show, :edit, :update, :destroy]
  def index
    @product_lines = ProductLine.all

    render 'product_lines/index' 
  end

  def show
  end

  def new
    @product_line = ProductLine.new
  end

  def create
    @product_line = ProductLine.new(product_line_params)

    if @product_line.save
      respond_to do |format|
        format.html { redirect_to product_lines_path, notice: "Product Line was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  # def create
  #   @product_line = ProductLine.new(product_line_params)
  
  #   if @product_line.save
  #     respond_to do |format|
  #       format.html { redirect_to @product_line }
  #       format.turbo_stream { render turbo_stream: turbo_stream.prepend("product_lines", @product_line) }
  #     end
  #   else
  #     render :new, status: :unprocessable_entity    end
  # end
  
  def edit
  end

  def update
    if @product_line.update(product_line_params)
      redirect_to product_lines_path, notice: "Product Line was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product_line.destroy

    respond_to do |format|
      format.html { redirect_to product_lines_path, notice: "Product Line was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_product_line
    @product_line = ProductLine.find(params[:id])
  end

  def product_line_params
    params.require(:product_line).permit(:name)
  end
end
