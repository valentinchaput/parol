class AddPartToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :part, :string
  end
end
