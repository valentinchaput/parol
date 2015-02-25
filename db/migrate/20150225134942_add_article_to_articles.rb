class AddArticleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article, :string
  end
end
