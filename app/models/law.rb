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
    create_branch_from('master', "Creation de #{title}")
  end

end
