require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "recipe should have a title" do
    recipe = Recipe.new(
      instruction: 'test',
      description: 'test',
      image: 'test'
    )
    assert_not recipe.save, "Recipe saved without title"
  end

  test "recipe should have a instruction" do
    recipe = Recipe.new(
      title: 'test',
      description: 'test',
      image: 'test'
    )
    assert_not recipe.save, "Recipe saved without instruction"
  end

  test "recipe should have a description" do
    recipe = Recipe.new(
      instruction: 'test',
      title: 'test',
      image: 'test'
    )
    assert_not recipe.save, "Recipe saved without description"
  end

  test "recipe should have a image" do
    recipe = Recipe.new(
      instruction: 'test',
      description: 'test',
      title: 'test'
    )
    assert_not recipe.save, "Recipe saved without image"
  end
end
