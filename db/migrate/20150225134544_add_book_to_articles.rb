class AddBookToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :book, :string
  end
end
