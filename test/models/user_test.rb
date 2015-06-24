require 'test_helper'

class UserTest < ActiveSupport::TestCase

  user = User.new(username: "username", email: "email@truth.com", password: "passhash")
  
  test "username required to register" do
    user.username = "       "
    assert user.valid?
  end

  test "email required to register" do
    user.email = "       "
    assert user.valid?
  end

  test "password required to register" do
    user.password = "       "
    assert user.valid?
  end
end