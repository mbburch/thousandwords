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

#set up with real info from twitter. In first assert, call method that accesses API. Will get error
#message with instructions of what to do and should create the cassettes folder.
