# frozen_string_literal: true

class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'An anonymous user can see home page' do
    sign_out :user
    get root_path
    assert_response :success
  end

  test 'An anonymous user cannot see other pages than home' do
    sign_out :user
    get recipes_path
    assert_response :redirect
    assert_redirected_to new_user_session_path

    recipe = recipes(:sandwich_jambon)
    get recipe_path(recipe)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'An authenticated user can see pages like recipes' do
    sign_out :user
    get recipes_path
    assert_response :redirect
    assert_redirected_to new_user_session_path

    user = users(:alice)
    sign_in user
    get recipes_path
    assert_response :success
  end
end
