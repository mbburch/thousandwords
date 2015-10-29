require 'rails_helper'

RSpec.describe "User views dashboard", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within("header") do
        click_on "Log In"
      end
    end

    it "shows the current user profile" do
      within "#user-profile" do
        expect(page).to have_content "MB"
        expect(page).to have_content "@dirtandgreens"
      end
    end

    it "can view followers count" do
      within "#user-followers" do
        expect(page).to have_content "Followers:"
        expect(page).to have_content "42"
      end
    end

    it "can view following count" do
      within "#user-friends" do
        expect(page).to have_content "Following:"
        expect(page).to have_content "381"
      end
    end

    it "can view the timeline" do
      expect(page).to have_css('.tweet', count: 19)
    end

  end
end