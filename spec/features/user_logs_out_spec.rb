require "rails_helper"

RSpec.describe "User can log out" do
  context "as a logged in user" do
    before do
      visit root_path
      within(".navbar") do
        click_link "Log In"
      end
      assert page.has_content?("mb")
      assert page.has_link?("Log Out")
    end

    it "can log out" do
      click_link "Log Out"
      expect(current_path).to eq root_path
      within("body") do
        expect(page).to have_content("Log In")
      end
      expect(page).not_to have_content("mb")
    end
  end
end


  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: "1234",
      extra: {
        raw_info: {
          name: "MB",
          screen_name: "embee"
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end