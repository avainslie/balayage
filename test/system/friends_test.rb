require "application_system_test_case"

class stylistsTest < ApplicationSystemTestCase
  setup do
    @stylist = stylists(:one)
  end

  test "visiting the index" do
    visit stylists_url
    assert_selector "h1", text: "stylists"
  end

  test "creating a stylist" do
    visit stylists_url
    click_on "New stylist"

    fill_in "Email", with: @stylist.email
    fill_in "First name", with: @stylist.first_name
    fill_in "Last name", with: @stylist.last_name
    fill_in "Phone", with: @stylist.phone
    fill_in "Twitter", with: @stylist.twitter
    click_on "Create stylist"

    assert_text "stylist was successfully created"
    click_on "Back"
  end

  test "updating a stylist" do
    visit stylists_url
    click_on "Edit", match: :first

    fill_in "Email", with: @stylist.email
    fill_in "First name", with: @stylist.first_name
    fill_in "Last name", with: @stylist.last_name
    fill_in "Phone", with: @stylist.phone
    fill_in "Twitter", with: @stylist.twitter
    click_on "Update stylist"

    assert_text "stylist was successfully updated"
    click_on "Back"
  end

  test "destroying a stylist" do
    visit stylists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "stylist was successfully destroyed"
  end
end
