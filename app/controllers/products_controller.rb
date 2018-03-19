class ProductsController < ApplicationController
  def index
    @products = Product.published
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
  @product = Product.new(product_params)
  if @product.save
    flash[:notice] = 'You have sucessfully created the product'
    redirect_to products_url
  else
    flash[:notice] = 'There is an error'
    render :new
  end
  
  
  end

  def edit
    @product = Product.find(params[:id])
    render :new
  end

  def update
    @product = Product.find(params[:id])
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
    if @product.update(product_params)
      flash[:notice] = 'Update sucessfully'
      redirect_to products_url
    else
      flash[:notice] = 'Update error'
      render :new
    end 
  end
  def destroy
    @product = Product.find(params[:id])
    if  @product.destroy
      flash[:notice] = 'Destroy sucessfully'
        redirect_to products_url
    else
      flash[:notice] = 'Destroy error'
        redirect_to products_url
    end
  end

end