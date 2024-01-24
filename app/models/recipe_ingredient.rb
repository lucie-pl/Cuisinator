class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient


  validates :recipe_id, :ingredient_id, :unity, :quantity, presence: true
  validates :unity, presence: true, inclusion: { in: %w(ml cl l g kg cup tsp Tbsp) }
  validates :quantity, presence: true, numericality: { greater_than: 0 }


  def ingredients=(name)
    @ingredients_name = name
    self.ingredient = Ingredient.find_or_initialize_by(name)
  end
end
