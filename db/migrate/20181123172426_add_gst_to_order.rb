# frozen_string_literal: true

class AddGstToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :gst, :decimal
  end
end
