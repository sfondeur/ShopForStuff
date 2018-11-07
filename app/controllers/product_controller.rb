class ProductController < ApplicationController
  # collection of all Products
  def index
    @products = Product.order(:title)
  end

  # Specific Product by ID
  def show
    @product = Product.find(params[:id])
  end
end
