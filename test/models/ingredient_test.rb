require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  test 'ingredient should have a name' do
    ingredient = Ingredient.new
    assert_not ingredient.save, 'Ingredient saved without name'
  end
end
