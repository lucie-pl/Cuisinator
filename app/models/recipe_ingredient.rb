class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unity
  belongs_to :quantity

  accepts_nested_attributes_for :ingredient, :unity, :quantity

  validates :recipe_id, :ingredient_id, :unity_id, :quantity_id, presence: true
end
