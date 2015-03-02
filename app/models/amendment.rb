class Amendment < ActiveRecord::Base
  belongs_to :law_article

  validates :date, presence: true
  validates :amendment_number, presence: true
  validates :chamber, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :object, presence: true
  validates :status, presence: true
end
