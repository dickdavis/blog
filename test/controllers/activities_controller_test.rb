require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  test "should get new" do
    get new_activity_path
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post activities_path, params: { activity: { completed: @activity.completed, description: @activity.description, activity_category_id: @activity.activity_category.id } }
    end

    assert_redirected_to hourglass_path
  end

  test "should show activity" do
    get activity_url(@activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: { activity: { completed: @activity.completed, description: @activity.description } }
    assert_redirected_to hourglass_path
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to hourglass_path
  end
end
