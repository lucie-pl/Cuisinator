class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unity
  belongs_to :quantity
  accepts_nested_attributes_for :ingredient
  accepts_nested_attributes_for :quantity
  accepts_nested_attributes_for :unity

  #validates :recipe_id, :ingredient_id, :unity_id, :quantity_id, presence: true
end
