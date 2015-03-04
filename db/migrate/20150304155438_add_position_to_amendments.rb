class AddPositionToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :position, :integer
  end
end
