# frozen_string_literal: true

class RemoveProvinceFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :province, :string
  end
end
