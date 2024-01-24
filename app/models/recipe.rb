class Recipe < ApplicationRecord
  has_many :recipe_ingredients, inverse_of: :recipe
  has_many :ingredients, through: :recipe_ingredients
  # has_many :my_recipes
  # has_many :users, through: :my_recipes
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  validates :title, :description, :instruction, :image, presence: true

end
