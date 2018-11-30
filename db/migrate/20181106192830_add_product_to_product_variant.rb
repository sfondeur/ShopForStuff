# frozen_string_literal: true

class AddProductToProductVariant < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_variants, :product, foreign_key: true
  end
end
