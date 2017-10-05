class ProductsController < ApplicationController
  before_action :load_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new product_params
    if product.save
      flash[:success] = t "create_success"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "update_success"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit :product_code, :name, :quantity, :unit_price
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "products.not_found"
    redirect_to products_path
  end
end
