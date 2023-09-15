class ProductVersionsController < ApplicationController
  def index
  @product_version=ProductVersion.all
  end

  def new
    @product_version = ProductVersion.new
  end

  def create
    @product_version = ProductVersion.new(product_version_params)

    if @product_version.save
      redirect_to @product_version, notice: 'Product version was successfully created.'
    else
      render :new
    end
  end
  def show
    @product_version = ProductVersion.find_by(id: params[:id])
  
    if @product_version.nil?
      flash[:alert] = 'Product version not found'
      redirect_to product_versions_path 
    end
  end
  def version_action
    if current_user.product_version.name == 'Paid'
    
    elsif current_user.product_version.name == 'Free trial'
     
    else
     
    end
  end
  private

  def product_version_params
    params.require(:product_version).permit(:name, :features)
  end
end
