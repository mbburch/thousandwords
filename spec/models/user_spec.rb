require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(uid: "12345",
                        name: "MB",
                        screen_name: "dirtandgreens",
                        oauth_token: "token",
                        oauth_token_secret: "secrettoken") }
end

  test "should be valid" do
    expect(:user).to be_valid
  end

end
