class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, foreign_key: 'recipe_id', inverse_of: :recipe_ingredients
  belongs_to :ingredient


  def ingredients=(name)
    @ingredients_name = name
    self.ingredient = Ingredient.find_or_initialize_by(name)
  end

  validates_presence_of :recipe
  validates :ingredient_id, :unity, :quantity, presence: true
  validates :unity, presence: true, inclusion: { in: %w(ml cl l g kg cup tsp Tbsp) }
  validates :quantity, presence: true, numericality: { greater_than: 0 }


end
