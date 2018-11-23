require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest


  test "should redirected if non authorized" do
    get '/admin'
    assert_response :redirect
  end

  # test "should true if will login" do
  #   setup { sign_in_as 'Admin'}
  #   get '/admin'
  #   assert_response :success
  # end
end
