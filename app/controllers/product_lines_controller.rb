class ProductLinesController < ApplicationController
    def index
        @product_lines = ProductLine.all
      end
    def new
        @product_line = ProductLine.new
      end
    
      def create
        @product_line = ProductLine.new(product_line_params)
        if @product_line.save
          redirect_to @product_line, notice: 'Product Line was successfully created.'
        else
          render :new
        end
      end
      def show
        @product_line = ProductLine.find(params[:id])
      end
      private
    
      def product_line_params
        params.require(:product_line).permit(:name)
      end
end
