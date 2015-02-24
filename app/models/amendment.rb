class Amendment < ActiveRecord::Base
  belongs_to :law
  has_many :instructions
  has_many :articles, through: :instructions

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :content, presence: true
end
