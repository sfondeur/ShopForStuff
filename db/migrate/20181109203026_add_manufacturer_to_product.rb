# frozen_string_literal: true

class AddManufacturerToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :manufacturer, :string
  end
end
