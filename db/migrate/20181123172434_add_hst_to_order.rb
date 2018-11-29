# frozen_string_literal: true

class AddHstToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :hst, :decimal
  end
end
