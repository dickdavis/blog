require "application_system_test_case"

class ActivityCategoriesTest < ApplicationSystemTestCase
  setup do
    @activity_category = activity_categories(:one)
  end

  test "visiting the index" do
    visit activity_categories_url
    assert_selector "h1", text: "Activity Categories"
  end

  test "creating a Activity category" do
    visit activity_categories_url
    click_on "New Activity Category"

    fill_in "Description", with: @activity_category.description
    fill_in "Label", with: @activity_category.label
    click_on "Create Activity category"

    assert_text "Activity category was successfully created"
    click_on "Back"
  end

  test "updating a Activity category" do
    visit activity_categories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @activity_category.description
    fill_in "Label", with: @activity_category.label
    click_on "Update Activity category"

    assert_text "Activity category was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity category" do
    visit activity_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity category was successfully destroyed"
  end
end
