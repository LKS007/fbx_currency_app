require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "check index method" do
    get "/users/new"
    assert_response :success
  end

  test "correct create user" do
    user_data = { login: 'test', password: 'test' }
    post "/users", params: { user: user_data }
    assert_response :redirect
    assert_redirected_to exchange_rates_path
  end

  test "create user with same login" do
    user_data = { login: 'admin', password: 'test' }
    post "/users", params: { user: user_data }
    assert_response :redirect
    assert_redirected_to "/signup"
  end
end
