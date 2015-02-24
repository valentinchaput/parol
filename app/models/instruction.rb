class Instruction < ActiveRecord::Base
  belongs_to :amendment
  belongs_to :article

  validates :command, presence: true
end
