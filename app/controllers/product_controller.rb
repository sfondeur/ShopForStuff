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

# TODO:
#   BE ABLE TO FILTER PRODUCTS BY RECENTLY UPDATED
#   BE ABLE TO FILTER PRODUCTS BY NEWLY CREATED
#   MAKE FRONT PAGE DEDICATED TO ONLY THESE TYPES OF PRODUCTS

