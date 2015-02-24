class Code < ActiveRecord::Base
  has_many :articles

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
