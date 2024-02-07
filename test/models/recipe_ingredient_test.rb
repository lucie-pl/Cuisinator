require "test_helper"

class RecipeIngredientTest < ActiveSupport::TestCase
  test "should have a recipe id, ingredient id, a unity and a quantity" do
    r_i = recipe_ingredients(:recipe_ingredient_bread)
    assert r_i.valid?
  end
end
