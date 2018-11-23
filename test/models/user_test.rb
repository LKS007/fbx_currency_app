require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the add user with same login" do
    u = User.new
    u.password = "1234"
    u.save

    assert_includes u.errors[:login], "can't be blank"

    u.login = 'admin'
    a = u.save

    assert_equal false, a, 'Users shold not registry with same login'

    u.login = "admin2"
    a = u.save

    assert_equal true, a, "User must be created"
  end
end
