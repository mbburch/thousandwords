require 'rails_helper'

RSpec.describe "User favorites tweet", type: :feature, vcr: true  do
  context "as a logged in user" do
    before do
      visit root_path
      within("header") do
        click_on "Log In"
      end
    end
  end

  it "can favorite and unfavorite a tweet" do
    page.first(".fave").click
    page.first(".unfave").click

    expect(current_path).to eq(dashboard_path)
  end
end
