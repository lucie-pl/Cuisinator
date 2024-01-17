require "test_helper"

class RecipeIngredientsControllerTest < ActionDispatch::IntegrationTest
  test "recipe_pain is valid" do
    r = recipe_ingredient(:ri_pain)
    assert r.valid?
  end
end
