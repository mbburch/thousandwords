require 'rails_helper'

RSpec.describe User, type: :model, vcr: true do
  let(:user) { User.new(oauth_token: ENV['USER_TOKEN'],
                        oauth_token_secret: ENV['USER_SECRET']) }

  it "should be valid" do
    expect(user).to be_valid
  end
end
