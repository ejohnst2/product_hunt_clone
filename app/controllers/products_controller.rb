class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def new
    @product = Product.new
  end

  def create
    @product = Product.create!(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :tagline)
  end
end
