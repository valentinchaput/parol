class CreateLawArticles < ActiveRecord::Migration
  def change
    create_table :law_articles do |t|
      t.string :article_number
      t.string :content
      t.string :object
      t.string :status
      t.references :law, index: true
      t.references :code_article, index: true

      t.timestamps null: false
    end
    add_foreign_key :law_articles, :laws
    add_foreign_key :law_articles, :code_articles
  end
end
