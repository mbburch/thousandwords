require "rails_helper"

RSpec.describe "User can log out", type: :feature, vcr: true do
  context "as a logged in user" do
    before do
      visit root_path
      within("main") do
        click_link "Log In"
      end
    end

    it "can log out" do
      assert page.has_content?("mb")
      assert page.has_link?("Log Out")

      within(".hide-on-med-and-down") do
        click_link "Log Out"
      end

      expect(current_path).to eq root_path

      within("body") do
        expect(page).to have_content("Log In")
      end
      expect(page).not_to have_content("mb")
    end
  end
end
