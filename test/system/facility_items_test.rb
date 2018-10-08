require "application_system_test_case"

class FacilityItemsTest < ApplicationSystemTestCase
  setup do
    @facility_item = facility_items(:one)
  end

  test "visiting the index" do
    visit facility_items_url
    assert_selector "h1", text: "Facility Items"
  end

  test "creating a Facility item" do
    visit facility_items_url
    click_on "New Facility Item"

    fill_in "Available Quantity", with: @facility_item.available_quantity
    fill_in "Facility Name", with: @facility_item.facility_name
    fill_in "Meeting Room", with: @facility_item.meeting_room_id
    click_on "Create Facility item"

    assert_text "Facility item was successfully created"
    click_on "Back"
  end

  test "updating a Facility item" do
    visit facility_items_url
    click_on "Edit", match: :first

    fill_in "Available Quantity", with: @facility_item.available_quantity
    fill_in "Facility Name", with: @facility_item.facility_name
    fill_in "Meeting Room", with: @facility_item.meeting_room_id
    click_on "Update Facility item"

    assert_text "Facility item was successfully updated"
    click_on "Back"
  end

  test "destroying a Facility item" do
    visit facility_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facility item was successfully destroyed"
  end
end
