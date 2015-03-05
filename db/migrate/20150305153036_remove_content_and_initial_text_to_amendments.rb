class RemoveContentAndInitialTextToAmendments < ActiveRecord::Migration
  def change
    remove_column :amendments, :content
    remove_column :amendments, :initial_text
  end
end
