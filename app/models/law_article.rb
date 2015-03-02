class LawArticle < ActiveRecord::Base
  belongs_to :law
  belongs_to :code_articles
  has_many :amendments

  validates :article_number, presence: true
  validates :content, presence: true
  validates :status, presence: true
end
