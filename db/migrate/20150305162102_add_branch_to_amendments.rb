class AddBranchToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :branch, :string
  end
end
