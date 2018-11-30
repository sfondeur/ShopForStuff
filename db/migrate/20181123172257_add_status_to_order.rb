# frozen_string_literal: true

class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string
  end
end
