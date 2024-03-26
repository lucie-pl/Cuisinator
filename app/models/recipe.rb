class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :instructions, dependent: :destroy
  # has_many :my_recipes
  # has_many :users, through: :my_recipes

  accepts_nested_attributes_for :instructions, allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  validates :title, :description, :image, presence: true
end
