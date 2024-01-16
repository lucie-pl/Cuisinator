class Unity < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :unity, presence: true, inclusion: { in: %w(ml cl l g kg cup tsp Tbsp) }
end
