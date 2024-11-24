class AddDeletedFieldToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :deleted, :boolean, default: false
    add_index :articles, :deleted
  end
end
