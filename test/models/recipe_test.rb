require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "recipe should have a title" do
    recipe = Recipe.new(
      description: 'test',
      image: 'test'
    )
    assert_not recipe.save, "Recipe saved without title"
  end

  test "recipe should have a description" do
    recipe = Recipe.new(
      title: 'test',
      image: 'test'
    )
    assert_not recipe.save, "Recipe saved without description"
  end

  test "recipe should have a image" do
    recipe = Recipe.new(
      description: 'test',
      title: 'test'
    )
    assert_not recipe.save, "Recipe saved without image"
  end
end
