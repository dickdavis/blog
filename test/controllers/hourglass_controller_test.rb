require 'test_helper'

class HourglassControllerTest < ActionDispatch::IntegrationTest
  ##
  # Sets up the test case.
  setup do
    @user = User.create!(email: 'example@example.com', password: 'letmein')
  end

  test "should get index" do
    get hourglass_path(as: @user)
    assert_response :success
  end

end
