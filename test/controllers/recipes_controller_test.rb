# frozen_string_literal: true

require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test 'sandwich au jambon has 2 RI pain and jambon' do
    recipe = recipes(:sandwich_jambon)
    assert recipe.valid?
  end
end
