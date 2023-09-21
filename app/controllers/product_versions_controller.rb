class ProductVersionsController < ApplicationController
  before_action :set_product_version, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @product_version = ProductVersion.where("name LIKE ?", "%#{params[:search]}%")
    else
      @courses = Course.all
    end
    @product_versions = ProductVersion.all
  end

  def show

  end

  def new
    @product_version = ProductVersion.new
  end

  def create
    @product_version = ProductVersion.new(product_version_params)
  
    if @product_version.save
      respond_to do |format|
        format.html { redirect_to product_versions_url, notice: 'Product version was successfully created.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("product_versions_list", partial: "product_versions/product_version", locals: { product_version: @product_version }) }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  
  def edit
  end

  def update
    if @product_version.update(product_version_params)
      redirect_to product_versions_path, notice: 'Product version was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  
    if @product_version
      @product_version.destroy
  
      respond_to do |format|
        format.html { redirect_to product_versions_path, notice: 'Product version was successfully deleted.' }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@product_version) }
      end
    else
      # Handle the case where @product_version is nil, e.g., by redirecting or displaying an error message.
    end
  end
  

  private

  def set_product_version
    @product_version = ProductVersion.find(params[:id])
  end

  def product_version_params
    params.require(:product_version).permit(:name, :features)
  end
end
