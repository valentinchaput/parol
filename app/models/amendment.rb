class Amendment < ActiveRecord::Base
  belongs_to :law_article
  # has_many :instructions
  # has_many :articles, through: :instructions

  validates :date, presence: true
  validates :amendment_number, presence: true
  validates :chamber, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :object, presence: true
  validates :status, presence: true
end
