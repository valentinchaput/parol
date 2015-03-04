class AddGitHubPathToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :github_path, :string
  end
end
