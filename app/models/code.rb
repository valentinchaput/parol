class Code < ActiveRecord::Base
  has_many :code_articles

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
