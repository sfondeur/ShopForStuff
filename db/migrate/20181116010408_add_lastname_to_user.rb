# frozen_string_literal: true

class AddLastnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastname, :string
  end
end
