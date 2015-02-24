class Law < ActiveRecord::Base
  has_many :amendments

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
