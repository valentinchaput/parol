class AddTitleToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :title, :string
  end
end
