class ProductController < ApplicationController
  # collection of all Products
  def index
    # @products = Product.order(:title)

    # Product.where("created_at >= ?", 1.week.ago.utc).order("DESC, created_at DESC")

    @products = Product.order(:title).page(params[:page]).per(4)
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

