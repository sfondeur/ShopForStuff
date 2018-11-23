class AddPstToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pst, :decimal
  end
end
