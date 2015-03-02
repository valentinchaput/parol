class CodeArticle < ActiveRecord::Base
  belongs_to :code
  has_many :law_articles

  validates :article_number, presence: true
  validates :content, presence: true, uniqueness: true
end
