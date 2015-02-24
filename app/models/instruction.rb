class Instruction < ActiveRecord::Base
  belongs_to :amendment
  belongs_to :article
end
