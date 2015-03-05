class AddBranchToLawArticles < ActiveRecord::Migration
  def change
    add_column :law_articles, :branch, :string
  end
end
