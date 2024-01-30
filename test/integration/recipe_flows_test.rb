require 'test_helper'

class RecipeFlowsTest < ActionDispatch::IntegrationTest
  test 'can we see recipes page' do
    get recipes_path
    assert_select 'h1', 'TOUTES LES RECETTES'
  end

  test 'can we see the list of recipes' do
    get '/recipes'
    assert_select 'li'
  end

  # test "should create Recipe" do
  #   visit recipes_path

  #   click_on "< Ajouter un nouvelle recette"

  #   fill_in "Title", with: "Creating a recipe"
  #   fill_in "Description", with: "Created this recipe successfully!"

  #   click_on "Ajouter ma recette"

  #   assert_text "Creating a recipe"
  # end

  test 'can create a recipe' do
    get '/recipes/new'
    assert_response :success

    post '/recipes',
      params: { recipe: {
        title: 'can create',
        description: 'recipe successfully.',
        instruction: '1- Verser. 2- Mélanger',
        image: 'test.png' }
      }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'Title:\n  can create'
  end

end
