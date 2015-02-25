class AddSubSectionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sub_section, :string
  end
end
