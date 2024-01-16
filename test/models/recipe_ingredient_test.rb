require "test_helper"

class RecipeIngredientTest < ActiveSupport::TestCase
  test "should have a recipe id, ingredient id, unity id and quantity id" do
    r_i = recipe_ingredients(:one)
    assert r_i.valid?
  end
end
