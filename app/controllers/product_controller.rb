# frozen_string_literal: true

class ProductController < ApplicationController
  # collection of all Products
  def index
    # @products = Product.order(:title)
    # Product.where("created_at >= ?", 1.week.ago.utc).order("DESC, created_at DESC")
    # @products = Product.order(:title).page(params[:page]).per(5)

    @products = Product.sort_by(params[:order]).page(params[:page]).per(5)
  end

  # Specific Product by ID
  def show
    @product = Product.find(params[:id])
  end

  # POST /product/:id/add_to_cart
  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)

    flash[:success] = 'Item has been added!'
    redirect_to root_url  
  end

  # Clears the shopping cart session
  #  POST /product/clear_cart
  def clear_cart
    session[:cart] = []
    flash[:info] = 'Cart has been emptied!'
    redirect_to root_url
  end

  # remove specific items from cart
  def remove_item
    cart_item_id = params[:id].to_i
    session[:cart].delete(cart_item_id)

    flash[:info] = 'Item has been removed!'
    redirect_to cart_url
  end
end
