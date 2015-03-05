class Amendment < ActiveRecord::Base
  include Branchable

  belongs_to :law_article

  validates :amendment_number,  presence: true, uniqueness: { scope: :law_article_id }
  validates :author,            presence: true
  validates :object,            presence: true

  before_validation :set_branch_name
  validates :branch, presence: true, uniqueness: true

  before_create :create_branch

  def push_code_article(filepath, content)
    commit = octokit_client.commit(ENV['GITHUB_LAW_REPO'], law_article.branch)
    code_article = CodeArticle.find(filepath, commit.sha)

    blob_sha = octokit_client.contents(ENV['GITHUB_LAW_REPO'], path: filepath, ref: law_article.branch)[:sha]
    octokit_client.update_contents(
      ENV['GITHUB_LAW_REPO'],
      filepath,
      "Modification de l'article #{code_article.article_number}",
      blob_sha,
      code_article.raw_header + content,
      branch: branch
    )
  end

  private

  def set_branch_name
    self.branch = "#{law_article.branch}-amendement-#{amendment_number.parameterize}"
  end

  def create_branch
    create_branch_from(law_article.branch, "Amendement #{amendment_number} modifie l'#{law_article.article_number} de #{law_article.law.title}")
  end
end
