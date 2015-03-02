class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :title
      t.text :description
      t.string :status

      t.timestamps null: false
    end
  end
end
