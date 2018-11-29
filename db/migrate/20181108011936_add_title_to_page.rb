# frozen_string_literal: true

class AddTitleToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :title, :string
  end
end
