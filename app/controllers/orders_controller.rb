# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all.where(user_id: current_user.id).order('created_at DESC')

    # if customer_signed_in?
    # @orders = current_user.orders.order(updated_at: :desc)
  end

  def show
    @order = Order.find(params[:id])

    # grab all products inside the order?
  end

  def new; end
end
