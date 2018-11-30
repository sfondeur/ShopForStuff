# frozen_string_literal: true

class AddPictureToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :picture, :string
  end
end
