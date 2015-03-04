class AddInitialTextToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :initial_text, :text
  end
end
