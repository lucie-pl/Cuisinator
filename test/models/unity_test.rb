require "test_helper"

class UnityTest < ActiveSupport::TestCase
  test "unity should be from a given collection" do
    u = unities(:one)
    assert u.valid?
    #TODO validate the inclusion ???
  end
end
