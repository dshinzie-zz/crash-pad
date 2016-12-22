require 'rails_helper'

describe "As a logged in user" do
  context "when I click the overview link" do
    it "shows me profile information" do
      user = stub_login_user

      user.update(verified: true)

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
      click_on "Show Profile"
      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path(user))
    end

    it "allows me to edit profile" do
      user = stub_login_user

      visit root_path
      click_on "Dashboard"
      click_on "Show Profile"
      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path(user))

      fill_in 'Email', with: "johnnyquest@test.com"
      fill_in 'First Name', with: "Johnny"
      fill_in 'Last Name', with: "Quest"
      fill_in 'Phone Number', with: "999-999-9999"

      click_on "Update Account"

      expect(current_path).to eq(dashboard_path(user))
      expect(page).to have_content("johnnyquest@test.com")
      expect(page).to have_content("Johnny")
      expect(page).to have_content("Quest")
      expect(page).to have_content("999-999-9999")

      expect(page).to_not have_content(user.email)
      expect(page).to_not have_content(user.first_name)
      expect(page).to_not have_content(user.last_name)
      expect(page).to_not have_content(user.phone)

    end

    it "allows me to edit profile" do
      user = stub_login_user

      visit root_path
      click_on "Dashboard"
      click_on "Show Profile"
      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path(user))

      fill_in 'First name', with: ""

      click_on "Update Account"

      expect(current_path).to eq(edit_user_path(user))
      # expect(page).to have_content("Not valid information")
    end
  end

end
