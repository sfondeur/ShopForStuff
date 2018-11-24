# frozen_string_literal: true

class CartsController < ApplicationController

  before_action :authenticate_user!

  def index
		
  end

  def subtotal
    total = 0
    @shopping_cart.each do |item|
      total = total + item.price
    end

    total
  end
  helper_method :subtotal

  def total
    
  end
end
