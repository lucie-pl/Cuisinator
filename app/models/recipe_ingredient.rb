class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unity
  belongs_to :quantity
  # accepts_nested_attributes_for :ingredient
  # accepts_nested_attributes_for :quantity
  # accepts_nested_attributes_for :unity


#TODO: This is a temporary fix to handle the strange structure of parameters
# given by the nested forms and cocooned.
# There shouldn't be any reasons to not have 'ingredient_attributes' (resp.
# quantity_attributes and unity_attributes) but until we understand how to get
# those parameters, this will do.
  def ingredients=(name)
    @ingredients_name = name
    self.ingredient = Ingredient.find_or_initialize_by(name)
  end

  def quantities=(quantity)
    @quantities_quantity = quantity
    self.quantity = Quantity.find_or_initialize_by(quantity)
  end

  def unities=(unity)
    @unities_unity = unity
    self.unity = Unity.find_or_initialize_by(unity)
  end
  #validates :recipe_id, :ingredient_id, :unity_id, :quantity_id, presence: true
end
