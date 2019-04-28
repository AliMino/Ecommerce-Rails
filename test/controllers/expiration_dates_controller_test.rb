require 'test_helper'

class ExpirationDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expiration_date = expiration_dates(:one)
  end

  test "should get index" do
    get expiration_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_expiration_date_url
    assert_response :success
  end

  test "should create expiration_date" do
    assert_difference('ExpirationDate.count') do
      post expiration_dates_url, params: { expiration_date: { date: @expiration_date.date } }
    end

    assert_redirected_to expiration_date_url(ExpirationDate.last)
  end

  test "should show expiration_date" do
    get expiration_date_url(@expiration_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_expiration_date_url(@expiration_date)
    assert_response :success
  end

  test "should update expiration_date" do
    patch expiration_date_url(@expiration_date), params: { expiration_date: { date: @expiration_date.date } }
    assert_redirected_to expiration_date_url(@expiration_date)
  end

  test "should destroy expiration_date" do
    assert_difference('ExpirationDate.count', -1) do
      delete expiration_date_url(@expiration_date)
    end

    assert_redirected_to expiration_dates_url
  end
end
