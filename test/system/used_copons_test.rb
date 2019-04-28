require "application_system_test_case"

class UsedCoponsTest < ApplicationSystemTestCase
  setup do
    @used_copon = used_copons(:one)
  end

  test "visiting the index" do
    visit used_copons_url
    assert_selector "h1", text: "Used Copons"
  end

  test "creating a Used copon" do
    visit used_copons_url
    click_on "New Used Copon"

    click_on "Create Used copon"

    assert_text "Used copon was successfully created"
    click_on "Back"
  end

  test "updating a Used copon" do
    visit used_copons_url
    click_on "Edit", match: :first

    click_on "Update Used copon"

    assert_text "Used copon was successfully updated"
    click_on "Back"
  end

  test "destroying a Used copon" do
    visit used_copons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Used copon was successfully destroyed"
  end
end
