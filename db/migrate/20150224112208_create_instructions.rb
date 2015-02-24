class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :command
      t.references :amendment, index: true
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :instructions, :amendments
    add_foreign_key :instructions, :articles
  end
end
