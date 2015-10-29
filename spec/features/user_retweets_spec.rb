require 'rails_helper'

RSpec.describe "User retweets tweet", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within(".btn-large") do
        click_on "Log In"
      end
    end

    it "can retweet a tweet" do
      expect(current_path).to eq(dashboard_path)

      page.first(".retweet").click

      expect(current_path).to eq(dashboard_path)
    end
  end
end