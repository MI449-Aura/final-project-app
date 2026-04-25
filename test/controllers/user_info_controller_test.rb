require "test_helper"

class UserInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_info_index_url
    assert_response :success
  end
end
