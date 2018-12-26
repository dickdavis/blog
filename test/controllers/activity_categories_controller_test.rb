require 'test_helper'

class ActivityCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein')
    @activity_category = activity_categories(:one)
  end

  test "should get index" do
    get activity_categories_path(as: @user)
    assert_response :success
  end

  test "should get new" do
    get new_activity_category_path(as: @user)
    assert_response :success
  end

  test "should create activity_category" do
    assert_difference('ActivityCategory.count') do
      post activity_categories_path(as: @user), params: { activity_category: { description: @activity_category.description, label: @activity_category.label } }
    end

    assert_redirected_to activity_category_url(ActivityCategory.last)
  end

  test "should show activity_category" do
    get activity_category_path(@activity_category, as: @user)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_category_path(@activity_category, as: @user)
    assert_response :success
  end

  test "should update activity_category" do
    patch activity_category_path(@activity_category, as: @user), params: { activity_category: { description: @activity_category.description, label: @activity_category.label } }
    assert_redirected_to activity_category_path(@activity_category)
  end

  test "should destroy activity_category" do
    assert_difference('ActivityCategory.count', -1) do
      delete activity_category_path(@activity_category, as: @user)
    end

    assert_redirected_to activity_categories_path
  end
end
