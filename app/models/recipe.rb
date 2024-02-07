class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  # has_many :my_recipes
  # has_many :users, through: :my_recipes

  accepts_nested_attributes_for :recipe_ingredients
  validates :title, :description, :instruction, :image, presence: true
end
