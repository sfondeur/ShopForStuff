class AddPermalinkToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :permalink, :string
  end
end
