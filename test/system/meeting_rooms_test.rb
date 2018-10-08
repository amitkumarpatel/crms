require "application_system_test_case"

class MeetingRoomsTest < ApplicationSystemTestCase
  setup do
    @meeting_room = meeting_rooms(:one)
  end

  test "visiting the index" do
    visit meeting_rooms_url
    assert_selector "h1", text: "Meeting Rooms"
  end

  test "creating a Meeting room" do
    visit meeting_rooms_url
    click_on "New Meeting Room"

    fill_in "Floor No", with: @meeting_room.floor_no
    fill_in "Name", with: @meeting_room.name
    click_on "Create Meeting room"

    assert_text "Meeting room was successfully created"
    click_on "Back"
  end

  test "updating a Meeting room" do
    visit meeting_rooms_url
    click_on "Edit", match: :first

    fill_in "Floor No", with: @meeting_room.floor_no
    fill_in "Name", with: @meeting_room.name
    click_on "Update Meeting room"

    assert_text "Meeting room was successfully updated"
    click_on "Back"
  end

  test "destroying a Meeting room" do
    visit meeting_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meeting room was successfully destroyed"
  end
end
