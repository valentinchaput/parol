class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.string :chamber
      t.string :author
      t.string :amendment_number
      t.text :content
      t.text :object
      t.date :date
      t.string :status
      t.references :law_article, index: true

      t.timestamps null: false
    end
    add_foreign_key :amendments, :law_articles
  end
end
