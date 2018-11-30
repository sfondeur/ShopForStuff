# frozen_string_literal: true

class CartsController < ApplicationController

  before_action :authenticate_user!

  def index
    # subtotal
    session[:subtotal] = subtotal
    session[:total] = total
  end

  def subtotal
    subtotal = 0
    @shopping_cart.each do |item|
      subtotal += item.price
    end

    subtotal
  end
  helper_method :subtotal

  # calculates the total amount to be paid for the order
  def total
    # @total = ((@total_tax_rate + 1) * session[:subtotal])
    @total = tax_amount + subtotal
  end

  # calculates taxes
  def tax_amount
    @province = current_user.province_id
    province = Province.find(@province)
    @gst = province.gst
    @pst = province.pst
    @hst = province.hst

    # sessions for taxes to be used in Order creation
    session[:gst] ||= @gst
    session[:pst] ||= @pst
    session[:hst] ||= @hst

    @total_tax_rate = @gst + @pst + @hst

    @total_tax_amount = (subtotal * @total_tax_rate).to_d
  end
end
