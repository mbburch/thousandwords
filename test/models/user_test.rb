require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(uid: "12345",
                     name: "User",
                     screen_name: "user123",
                     oauth_token: "pizza",
                     oauth_token_secret: "secretpizza")
  end

  test "should be valid" do
    assert @user.valid?
  end

end
