require "application_system_test_case"

class CoponsTest < ApplicationSystemTestCase
  setup do
    @copon = copons(:one)
  end

  test "visiting the index" do
    visit copons_url
    assert_selector "h1", text: "Copons"
  end

  test "creating a Copon" do
    visit copons_url
    click_on "New Copon"

    fill_in "Discount", with: @copon.discount
    fill_in "Expiration type", with: @copon.expiration_type
    check "Has fixed amount" if @copon.has_fixed_amount
    click_on "Create Copon"

    assert_text "Copon was successfully created"
    click_on "Back"
  end

  test "updating a Copon" do
    visit copons_url
    click_on "Edit", match: :first

    fill_in "Discount", with: @copon.discount
    fill_in "Expiration type", with: @copon.expiration_type
    check "Has fixed amount" if @copon.has_fixed_amount
    click_on "Update Copon"

    assert_text "Copon was successfully updated"
    click_on "Back"
  end

  test "destroying a Copon" do
    visit copons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Copon was successfully destroyed"
  end
end
