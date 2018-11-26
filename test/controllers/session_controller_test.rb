require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "test get login" do
    get '/login'
    assert_response :success
  end

  test "fail authorization" do
    session_param = {login: users(:admin)[:login], password: 'qwerty'}
    post "/login", params: {session: session_param}

    assert_response :redirect
    assert_redirected_to "/login"
  end

  test "destroy session" do
    sign_in_as(:admin)
    delete "/logout"
    assert_response :redirect
    assert_redirected_to "/"
  end
end
