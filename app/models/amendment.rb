class Amendment < ActiveRecord::Base
  belongs_to :law_article

  validates :amendment_number,  presence: true
  validates :author,            presence: true
  validates :chamber,           presence: true
  validates :content,           presence: true
  validates :date,              presence: true
  validates :initial_text,      presence: true
  validates :object,            presence: true
  validates :status,            presence: true
end
