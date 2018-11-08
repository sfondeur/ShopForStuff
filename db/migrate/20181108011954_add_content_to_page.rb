class AddContentToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :content, :text
  end
end
