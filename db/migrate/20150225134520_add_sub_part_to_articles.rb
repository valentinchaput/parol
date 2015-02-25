class AddSubPartToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sub_part, :string
  end
end
