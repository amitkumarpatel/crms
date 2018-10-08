require 'test_helper'

class FacilityItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility_item = facility_items(:one)
  end

  test "should get index" do
    get facility_items_url
    assert_response :success
  end

  test "should get new" do
    get new_facility_item_url
    assert_response :success
  end

  test "should create facility_item" do
    assert_difference('FacilityItem.count') do
      post facility_items_url, params: { facility_item: { available_quantity: @facility_item.available_quantity, facility_name: @facility_item.facility_name, meeting_room_id: @facility_item.meeting_room_id } }
    end

    assert_redirected_to facility_item_url(FacilityItem.last)
  end

  test "should show facility_item" do
    get facility_item_url(@facility_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_facility_item_url(@facility_item)
    assert_response :success
  end

  test "should update facility_item" do
    patch facility_item_url(@facility_item), params: { facility_item: { available_quantity: @facility_item.available_quantity, facility_name: @facility_item.facility_name, meeting_room_id: @facility_item.meeting_room_id } }
    assert_redirected_to facility_item_url(@facility_item)
  end

  test "should destroy facility_item" do
    assert_difference('FacilityItem.count', -1) do
      delete facility_item_url(@facility_item)
    end

    assert_redirected_to facility_items_url
  end
end
