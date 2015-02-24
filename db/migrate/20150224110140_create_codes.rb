class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
