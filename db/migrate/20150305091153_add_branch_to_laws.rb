class AddBranchToLaws < ActiveRecord::Migration
  def change
    add_column :laws, :branch, :string
  end
end
