require 'test_helper'

class LeaveManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_management = leave_managements(:one)
  end

  test "should get index" do
    get leave_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_management_url
    assert_response :success
  end

  test "should create leave_management" do
    assert_difference('LeaveManagement.count') do
      post leave_managements_url, params: { leave_management: { date: @leave_management.date, holiday_name: @leave_management.holiday_name, user_id: @leave_management.user_id } }
    end

    assert_redirected_to leave_management_url(LeaveManagement.last)
  end

  test "should show leave_management" do
    get leave_management_url(@leave_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_management_url(@leave_management)
    assert_response :success
  end

  test "should update leave_management" do
    patch leave_management_url(@leave_management), params: { leave_management: { date: @leave_management.date, holiday_name: @leave_management.holiday_name, user_id: @leave_management.user_id } }
    assert_redirected_to leave_management_url(@leave_management)
  end

  test "should destroy leave_management" do
    assert_difference('LeaveManagement.count', -1) do
      delete leave_management_url(@leave_management)
    end

    assert_redirected_to leave_managements_url
  end
end
