require 'rails_helper'

RSpec.describe "User creates a tweet", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within(".btn-large") do
        click_on "Log In"
      end
    end

    it "can post a new tweet" do
      within(".hide-on-med-and-down") do
        click_on "New Tweet"
      end
      expect(current_path).to eq(new_tweet_path)

      fill_in :tweet, with: "I have something to say!"
      click_on "Post Tweet"

      expect(current_path).to eq(dashboard_path)
    end
  end
end