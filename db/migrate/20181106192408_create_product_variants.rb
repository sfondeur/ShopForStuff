# frozen_string_literal: true

class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.string :title
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
