require 'rails_helper'

RSpec.describe "User unfollows friend", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within(".btn-large") do
        click_on "Log In"
      end
    end

    it "can unfollow another user" do
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content "Following: 381"
      page.first(".unfollow").click

      expect(current_path).to eq(dashboard_path)
    end
  end
end
