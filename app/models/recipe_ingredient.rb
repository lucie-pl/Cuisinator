class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient

  validates :recipe_id, :ingredient_id, :unity, :quantity, presence: true
  validates :unity, presence: true, inclusion: { in: %w(ml cl l g kg cup tsp Tbsp) }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
