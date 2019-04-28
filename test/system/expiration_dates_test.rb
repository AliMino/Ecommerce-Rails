require "application_system_test_case"

class ExpirationDatesTest < ApplicationSystemTestCase
  setup do
    @expiration_date = expiration_dates(:one)
  end

  test "visiting the index" do
    visit expiration_dates_url
    assert_selector "h1", text: "Expiration Dates"
  end

  test "creating a Expiration date" do
    visit expiration_dates_url
    click_on "New Expiration Date"

    fill_in "Date", with: @expiration_date.date
    click_on "Create Expiration date"

    assert_text "Expiration date was successfully created"
    click_on "Back"
  end

  test "updating a Expiration date" do
    visit expiration_dates_url
    click_on "Edit", match: :first

    fill_in "Date", with: @expiration_date.date
    click_on "Update Expiration date"

    assert_text "Expiration date was successfully updated"
    click_on "Back"
  end

  test "destroying a Expiration date" do
    visit expiration_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expiration date was successfully destroyed"
  end
end
