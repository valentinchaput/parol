class RemoveContentAndInitialTextToAmendments < ActiveRecord::Migration
  def change
    remove_column :content, :initial_text
  end
end
