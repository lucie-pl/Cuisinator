class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, foreign_key: :ingredient_id
  has_many :quantities, through: :recipe_ingredients, foreign_key: :quantity_id
  has_many :unities, through: :recipe_ingredients, foreign_key: :unity_id
  accepts_nested_attributes_for :recipe_ingredients
  # has_many :my_recipes
  # has_many :users, through: :my_recipes

  validates :title, :description, :instruction, :image, presence: true
end
