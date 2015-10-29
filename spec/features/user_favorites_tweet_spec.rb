require 'rails_helper'

RSpec.describe "User favorites tweet", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within("header") do
        click_on "Log In"
      end
  end

    it "can favorite a tweet" do
      page.first('.fave').click
      expect(current_path).to eq(favorites_path)
      expect(page).not_to have_css(".glyphicon-star-empty")
      expect(page).to have_css(".glyphicon-star")
    end

  end
end
