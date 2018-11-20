# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
