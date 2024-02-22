class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, :ingredient, presence: true, on: :create
  validates :recipe_id, :ingredient_id, presence: true, on: :update
  validates :unity, presence: true, inclusion: { in: %w(ml cl L g kg cup tsp Tbsp) }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :ingredient, allow_destroy: true #false

  def ingredient_attributes=(name)
    self.ingredient = Ingredient.find_or_initialize_by(name)
  end
end
