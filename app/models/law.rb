class Law < ActiveRecord::Base
  has_many :amendments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
