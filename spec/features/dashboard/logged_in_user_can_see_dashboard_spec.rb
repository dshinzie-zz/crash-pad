require 'rails_helper'

describe "As a logged in user" do
  context "when I click the overview link" do
    it "shows me profile information" do
      user = stub_login_user

      visit root_path
      click_on "Dashboard"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(user.first_name)
      expect(page).to have_css('img', user.avatar_url)
    end
  end

  context "when I click on Edit Profile link" do
    it "shows me the edit profile page" do
      user = stub_login_user

      visit root_path
      click_on "Dashboard"
      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path)
    end
  end

end
