# frozen_string_literal: true

class CartsController < ApplicationController

  before_action :authenticate_user!

  def index
    session[:subtotal] = subtotal
  end

  def subtotal
    subtotal = 0
    @shopping_cart.each do |item|
      subtotal = subtotal + item.price
    end

    subtotal
  end
  helper_method :subtotal

  def total
    
  end
end
