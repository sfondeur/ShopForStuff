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
    # using provinces, calculate total amount to be paid.
    # subtotal * taxrate = taxamount
    # taxamount + subtotal = total

    # EX: 99.99 * 0.13 = 12.99
    # 12.99 + 99.99 = 112.98
  end
end
