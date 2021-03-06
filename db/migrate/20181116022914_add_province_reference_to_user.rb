# frozen_string_literal: true

class AddProvinceReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :province, foreign_key: true
  end
end
