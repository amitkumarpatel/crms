require "application_system_test_case"

class LeaveManagementsTest < ApplicationSystemTestCase
  setup do
    @leave_management = leave_managements(:one)
  end

  test "visiting the index" do
    visit leave_managements_url
    assert_selector "h1", text: "Leave Managements"
  end

  test "creating a Leave management" do
    visit leave_managements_url
    click_on "New Leave Management"

    fill_in "Date", with: @leave_management.date
    fill_in "Holiday Name", with: @leave_management.holiday_name
    fill_in "User", with: @leave_management.user_id
    click_on "Create Leave management"

    assert_text "Leave management was successfully created"
    click_on "Back"
  end

  test "updating a Leave management" do
    visit leave_managements_url
    click_on "Edit", match: :first

    fill_in "Date", with: @leave_management.date
    fill_in "Holiday Name", with: @leave_management.holiday_name
    fill_in "User", with: @leave_management.user_id
    click_on "Update Leave management"

    assert_text "Leave management was successfully updated"
    click_on "Back"
  end

  test "destroying a Leave management" do
    visit leave_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leave management was successfully destroyed"
  end
end
