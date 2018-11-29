# frozen_string_literal: true

class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :abbreviation
      t.decimal :gst
      t.decimal :pst
      t.decimal :hst
      t.decimal :total_rate

      t.timestamps
    end
  end
end
