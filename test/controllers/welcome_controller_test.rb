require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "check xhr" do
    get "/updated_index_with_ajx", xhr: true
    assert_response :success
  end

  test "check without xhr" do
    get "/updated_index_with_ajx"
    assert_response :redirect
  end

end
