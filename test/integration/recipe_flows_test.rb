require 'test_helper'

class RecipeFlowsTest < ActionDispatch::IntegrationTest
  test 'can see recipes page' do
    get recipes_path
    assert_select 'h1', 'TOUTES LES RECETTES'
  end

  test 'can see the list of all recipes' do
    get '/recipes'
    assert_select 'li'
  end

  test 'can see a specific recipe' do
    recipe = recipes(:sandwich_jambon)
    get recipe_path(recipe)
    assert_response :success
  end

  test 'can create a recipe, with nested attributes' do
    get '/recipes/new'
    assert_response :success

    post '/recipes',
      params: { recipe: {
        title: 'Omelette',
        description: 'Une bonne omelette maison.',
        image: 'https://test.com',
        instructions_attributes: [
          step: 1,
          instruction: 'Mélanger les oeufs'
        ],
        recipe_ingredients_attributes: [
          quantity: 3,
          unity: 'ml',
          ingredient_attributes: {
            name: 'oeuf'
          }
        ]
      } }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'Omelette'
  end

  test 'can update a recipe' do
    recipe = recipes(:omelette)
    patch recipe_path(recipe), params: { recipe: { title: "New omelette recipe" } }

    assert_redirected_to recipe_path(recipe)
    # Reload association to fetch updated data and assert that title is updated.
    recipe.reload
    assert_equal "New omelette recipe", recipe.title
  end

  test 'can delete a recipe' do
    recipe = recipes(:omelette)
    assert_difference("Recipe.count", -1) do
      delete recipe_path(recipe)
    end

    assert_redirected_to recipes_path
  end
end
