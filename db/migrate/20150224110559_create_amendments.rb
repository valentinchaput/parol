class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.references :law, index: true

      t.timestamps null: false
    end
    add_foreign_key :amendments, :laws
  end
end
