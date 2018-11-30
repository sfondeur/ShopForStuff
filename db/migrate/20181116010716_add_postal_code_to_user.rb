# frozen_string_literal: true

class AddPostalCodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :string
  end
end
