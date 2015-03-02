class CreateCodeArticles < ActiveRecord::Migration
  def change
    create_table :code_articles do |t|
      t.string :article_number
      t.text :content
      t.string :code
      t.string :part
      t.string :sub_part
      t.string :book
      t.string :title
      t.string :chapter
      t.string :section
      t.string :sub_section
      t.string :paragraph
      t.string :article
      t.references :code, index: true

      t.timestamps null: false
    end
    add_foreign_key :code_articles, :codes
  end
end
