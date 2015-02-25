class AddParagraphToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :paragraph, :string
  end
end
