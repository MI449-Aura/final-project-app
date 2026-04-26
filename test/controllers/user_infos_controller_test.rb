require "test_helper"

class UserInfosControllerTest < ActionDispatch::IntegrationTest
  test "create account with valid params" do
    email = "new-user-#{Time.now.to_i}@example.com"

    assert_difference("User.count", 1) do
      assert_difference("UserInfo.count", 1) do
        post user_infos_path, params: {
          email_address: email,
          password: "password123",
          password_confirmation: "password123"
        }
      end
    end

    assert_redirected_to "/user_info/sign-in"
  end

  test "create account with invalid params" do
    assert_no_difference("User.count") do
      post user_infos_path, params: {
        email_address: "broken@example.com",
        password: "password123",
        password_confirmation: "different"
      }
    end

    assert_response :unprocessable_entity
  end
end
