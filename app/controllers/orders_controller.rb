# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all.where(user_id: current_user.id).order('created_at DESC')

    # if customer_signed_in?
    # @orders = current_user.orders.order(updated_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new; end

  private

  def create_order
    province = current_user.province

    order = current_user.orders.create!(
      status: 'Pending',
      pst: province.pst,
      gst: province.gst,
      hst: province.hst
    )
  end
end
