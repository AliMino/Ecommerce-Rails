require 'test_helper'

class ExpirationUsagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expiration_usage = expiration_usages(:one)
  end

  test "should get index" do
    get expiration_usages_url
    assert_response :success
  end

  test "should get new" do
    get new_expiration_usage_url
    assert_response :success
  end

  test "should create expiration_usage" do
    assert_difference('ExpirationUsage.count') do
      post expiration_usages_url, params: { expiration_usage: { usage: @expiration_usage.usage } }
    end

    assert_redirected_to expiration_usage_url(ExpirationUsage.last)
  end

  test "should show expiration_usage" do
    get expiration_usage_url(@expiration_usage)
    assert_response :success
  end

  test "should get edit" do
    get edit_expiration_usage_url(@expiration_usage)
    assert_response :success
  end

  test "should update expiration_usage" do
    patch expiration_usage_url(@expiration_usage), params: { expiration_usage: { usage: @expiration_usage.usage } }
    assert_redirected_to expiration_usage_url(@expiration_usage)
  end

  test "should destroy expiration_usage" do
    assert_difference('ExpirationUsage.count', -1) do
      delete expiration_usage_url(@expiration_usage)
    end

    assert_redirected_to expiration_usages_url
  end
end
