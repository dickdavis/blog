require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein')
    @activity = activities(:one)
  end

  test "should get new" do
    get new_activity_path(as: @user)
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post activities_path(as: @user), params: { activity: { completed: @activity.completed, description: @activity.description, activity_category_id: @activity.activity_category.id } }
    end

    assert_redirected_to hourglass_path
  end

  test "should show activity" do
    get activity_path(@activity, as: @user)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_path(@activity, as: @user)
    assert_response :success
  end

  test "should update activity" do
    patch activity_path(@activity, as: @user), params: { activity: { completed: @activity.completed, description: @activity.description } }
    assert_redirected_to hourglass_path
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete activity_path(@activity, as: @user)
    end

    assert_redirected_to hourglass_path
  end
end
