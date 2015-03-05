class UpdateLawArticle < ActiveRecord::Migration
  def change
    remove_column :law_articles, :content
    remove_column :law_articles, :object
  end
end
