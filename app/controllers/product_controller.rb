class ProductController < ApplicationController

  # collection of all Products
  def index
    # @products = Product.order(:title)
    # Product.where("created_at >= ?", 1.week.ago.utc).order("DESC, created_at DESC")
    @products = Product.order(:title).page(params[:page]).per(5)
  end

  # Specific Product by ID
  def show
    @product = Product.find(params[:id])
  end

  # POST /product/:id/add_products_to_cart
  def add_products_to_cart
    id = params[:id].to_i
    # @shopping_cart << Product.find(params[:id])

    if session[:cart].include?(id)
      # quantity increments by 1
    end

    unless session[:cart].include?(id)
      session[:cart] << id
    end
    
    flash[:cart_item_added] = "Added to your cart!"
    redirect_to welcome_index_path
  end

  # Clears the shopping cart session
  #  POST /product/clear_cart
  def clear_cart
    session[:cart] = []
    redirect_to welcome_index_path
  end
end

# TODO:
#   BE ABLE TO FILTER PRODUCTS BY RECENTLY UPDATED
#   BE ABLE TO FILTER PRODUCTS BY NEWLY CREATED
#   MAKE FRONT PAGE DEDICATED TO ONLY THESE TYPES OF PRODUCTS

