require "test_helper"

class QuantityTest < ActiveSupport::TestCase
  test "quantity should be an integer" do
    q = quantities(:one)
    assert q.valid?
    assert q.quantity.is_a? Float
  end
end
