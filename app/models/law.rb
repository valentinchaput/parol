class Law < ActiveRecord::Base
  has_many :law_articles, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :status, presence: true
end
