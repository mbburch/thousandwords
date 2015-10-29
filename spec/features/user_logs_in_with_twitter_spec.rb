require "rails_helper"

RSpec.describe "User can log in with twitter", type: :feature, vcr: true do
  context "as a nonauthenticated user" do
    it "logs in with twitter" do
      visit root_path

      expect(page.status_code).to eq 200

      within("main") do
        click_link "Log In"
      end

      expect(current_path).to eq dashboard_path
      expect(page).to have_content("mb")
      expect(page).to have_link("Log Out")
    end
  end
end
