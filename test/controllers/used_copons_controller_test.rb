require 'test_helper'

class UsedCoponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @used_copon = used_copons(:one)
  end

  test "should get index" do
    get used_copons_url
    assert_response :success
  end

  test "should get new" do
    get new_used_copon_url
    assert_response :success
  end

  test "should create used_copon" do
    assert_difference('UsedCopon.count') do
      post used_copons_url, params: { used_copon: {  } }
    end

    assert_redirected_to used_copon_url(UsedCopon.last)
  end

  test "should show used_copon" do
    get used_copon_url(@used_copon)
    assert_response :success
  end

  test "should get edit" do
    get edit_used_copon_url(@used_copon)
    assert_response :success
  end

  test "should update used_copon" do
    patch used_copon_url(@used_copon), params: { used_copon: {  } }
    assert_redirected_to used_copon_url(@used_copon)
  end

  test "should destroy used_copon" do
    assert_difference('UsedCopon.count', -1) do
      delete used_copon_url(@used_copon)
    end

    assert_redirected_to used_copons_url
  end
end
