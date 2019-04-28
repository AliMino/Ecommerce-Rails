require 'test_helper'

class CoponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @copon = copons(:one)
  end

  test "should get index" do
    get copons_url
    assert_response :success
  end

  test "should get new" do
    get new_copon_url
    assert_response :success
  end

  test "should create copon" do
    assert_difference('Copon.count') do
      post copons_url, params: { copon: { discount: @copon.discount, expiration_type: @copon.expiration_type, has_fixed_amount: @copon.has_fixed_amount } }
    end

    assert_redirected_to copon_url(Copon.last)
  end

  test "should show copon" do
    get copon_url(@copon)
    assert_response :success
  end

  test "should get edit" do
    get edit_copon_url(@copon)
    assert_response :success
  end

  test "should update copon" do
    patch copon_url(@copon), params: { copon: { discount: @copon.discount, expiration_type: @copon.expiration_type, has_fixed_amount: @copon.has_fixed_amount } }
    assert_redirected_to copon_url(@copon)
  end

  test "should destroy copon" do
    assert_difference('Copon.count', -1) do
      delete copon_url(@copon)
    end

    assert_redirected_to copons_url
  end
end
