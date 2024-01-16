class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unity
  belongs_to :quantity

  validates :recipe_id, :ingredient_id, :unity_id, :quantity_id, presence: true
end
