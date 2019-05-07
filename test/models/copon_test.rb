require 'test_helper'

class CoponTest < ActiveSupport::TestCase
  test "should not save copon without name" do
  copon = Copon.new
  assert_not copon.save
  end
end
