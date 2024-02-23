class Instruction < ApplicationRecord
  belongs_to :recipe

  validates :recipe, presence: true, on: :create
  validates :instruction, presence: true
  validates :step, presence: true, numericality: { greater_than: 0 }

end
