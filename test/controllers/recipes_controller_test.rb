require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "sandwich au jambon has 2 RI pain and jambon" do
    q = recipe(:sandwich_jambon)
    assert q.valid?
  end
end
