class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.published
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_url, notice: 'You have sucessfully created the product' if @product.save
    flash[:alert] = 'There is an error'
    render :new
  end

  def edit
    render :new
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Update sucessfully'
      redirect_to products_url
    else
      flash[:notice] = 'Update error'
      render :new
    end 
  end

  def destroy
    if  @product.destroy
      flash[:notice] = 'Destroy sucessfully'
        redirect_to products_url
    else
      flash[:notice] = 'Destroy error'
        redirect_to products_url
    end
  end

  def get_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description,
                                                 :price, :published, 
                                                 :category_id, 
                                                 :level, 
                                                 :country)
  end

end