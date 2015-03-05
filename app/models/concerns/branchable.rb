module Branchable
  extend ActiveSupport::Concern

  def create_branch_from(base_branch_name, commit_message)
    commit = octokit_client.commit(ENV['GITHUB_LAW_REPO'], base_branch_name)
    commit_sha = commit.sha
    tree_sha = commit.commit.tree.sha

    commit = octokit_client.create_commit(ENV['GITHUB_LAW_REPO'], commit_message, tree_sha, commit_sha)
    octokit_client.create_ref(ENV['GITHUB_LAW_REPO'], "heads/#{self.branch}", commit.sha)
  end

  def octokit_client
    @octokit_client ||= Octokit::Client.new access_token: ENV['GITHUB_TOKEN']
  end
end