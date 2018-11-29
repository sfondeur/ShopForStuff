# frozen_string_literal: true

class AddOrderItemToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :order, foreign_key: true
  end
end
