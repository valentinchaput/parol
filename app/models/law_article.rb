class LawArticle < ActiveRecord::Base
  belongs_to :law
  # belongs_to :code_article

  has_many :amendments

  validates :law, presence: true
  validates :article_number, presence: true, uniqueness: { scope: :law_id }
  validates :status, presence: true

  before_validation :set_branch_name
  validates :branch, presence: true, uniqueness: true

  before_create :create_branch

  def object
    commit = octokit_client.commit(ENV['GITHUB_LAW_REPO'], branch)
    "Modification de " + commit.files.map(&:filename).join(", ")
  end

  def diff
    commit = octokit_client.commit(ENV['GITHUB_LAW_REPO'], branch)
    commit.files.map(&:patch).join
  end

  def updated_code_articles
    commit = octokit_client.commit(ENV['GITHUB_LAW_REPO'], branch)
    commit.files.map do |file|
      CodeArticle.find(file.filename, commit.sha)
    end
  end

  private

  def set_branch_name
    self.branch = "#{law.branch}-#{article_number.parameterize}"
  end

  def create_branch
    law_commit = octokit_client.commit(ENV['GITHUB_LAW_REPO'], law.branch)
    law_commit_sha = law_commit.sha
    law_tree_sha = law_commit.commit.tree.sha

    commit = octokit_client.create_commit(ENV['GITHUB_LAW_REPO'], "Creation de #{article_number} pour #{law.title}", law_tree_sha, law_commit_sha)
    octokit_client.create_ref(ENV['GITHUB_LAW_REPO'], "heads/#{branch}", commit.sha)
  end

  def octokit_client
    @octokit_client ||= Octokit::Client.new access_token: ENV['GITHUB_TOKEN']
  end
end
