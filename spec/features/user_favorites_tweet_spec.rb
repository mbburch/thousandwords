require 'rails_helper'

RSpec.describe "User favorites tweet", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within(".btn-large") do
        click_on "Log In"
      end
    end

    it "can favorite a tweet" do
      expect(current_path).to eq(dashboard_path)

      page.first(".fave").click

      expect(current_path).to eq(dashboard_path)
    end
  end
end
