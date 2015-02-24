class AddContentToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :content, :text
  end
end
