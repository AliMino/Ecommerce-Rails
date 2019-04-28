require "application_system_test_case"

class ExpirationUsagesTest < ApplicationSystemTestCase
  setup do
    @expiration_usage = expiration_usages(:one)
  end

  test "visiting the index" do
    visit expiration_usages_url
    assert_selector "h1", text: "Expiration Usages"
  end

  test "creating a Expiration usage" do
    visit expiration_usages_url
    click_on "New Expiration Usage"

    fill_in "Usage", with: @expiration_usage.usage
    click_on "Create Expiration usage"

    assert_text "Expiration usage was successfully created"
    click_on "Back"
  end

  test "updating a Expiration usage" do
    visit expiration_usages_url
    click_on "Edit", match: :first

    fill_in "Usage", with: @expiration_usage.usage
    click_on "Update Expiration usage"

    assert_text "Expiration usage was successfully updated"
    click_on "Back"
  end

  test "destroying a Expiration usage" do
    visit expiration_usages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expiration usage was successfully destroyed"
  end
end
