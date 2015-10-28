require "rails_helper"

RSpec.describe "User can log in with oauth" do
  scenario "as a nonauthenticated user" do
    it "can log in with twitter" do
      visit root_path
      expect(page.status_code).to eq 200
      within("body") do
        click_link "Log In"
      end
      expect(current_path).to eq dashboard_path
      expect(page).to have_content("mb")
      expect(page).to have_link("Log Out")
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