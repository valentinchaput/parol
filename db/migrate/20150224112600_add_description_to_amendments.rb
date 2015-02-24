class AddDescriptionToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :description, :text
  end
end
