class AddChapterToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :chapter, :string
  end
end
