class Article < ActiveRecord::Base
  belongs_to :code
  has_many :instructions

  validates :title, presence: true
  validates :content, presence: true, uniqueness: true
end
