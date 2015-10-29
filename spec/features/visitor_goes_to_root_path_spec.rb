require "rails_helper"

RSpec.describe "Visitor views welcome index", type: :feature, vcr: true do
  context "as a nonauthenticated user" do
    it "cannot see dashboard links" do
      visit root_path

      expect(page.status_code).to eq 200

      expect(current_path).not_to eq dashboard_path
      expect(page).not_to have_content("New Tweet")
      expect(page).not_to have_content("Profile")
      expect(page).not_to have_link("Log Out")
    end
  end
end