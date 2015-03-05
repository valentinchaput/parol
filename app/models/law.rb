class Law < ActiveRecord::Base
  has_many :law_articles, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true

  before_validation :set_branch_name
  validates :branch, presence: true, uniqueness: true

  before_create :create_branch

  private

  def set_branch_name
    self.branch = title.parameterize
  end

  def create_branch
    master_sha = octokit_client.tree(ENV['GITHUB_LAW_REPO'], 'master')[:sha]
    octokit_client.create_ref(ENV['GITHUB_LAW_REPO'], "heads/#{branch}", master_sha)
  end

  def octokit_client
    @octokit_client ||= Octokit::Client.new access_token: ENV['GITHUB_TOKEN']
  end
end
