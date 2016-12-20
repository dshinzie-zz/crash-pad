require 'rails_helper'

describe "A logged in admin" do
  context "who edits a user" do
    it "sees updated user information" do
      create_list :user, 3
      first_user = User.first
      third_user = User.third

      admin = stub_admin_user

      visit edit_admin_user_path(first_user)

      fill_in "user_first_name", :with => "brad"
      fill_in "user_status", :with => "offline"
      click_on "Update Account"

      expect(current_path).to eq(admin_user_path(first_user))
      expect(page).to have_content("brad")
      expect(page).to have_content("offline")
    end
  end
end
describe "A logged in user" do
  context "without admin privilege" do
    it "cannot edit a user" do
      create_list :user, 1
      user = User.first

      user = stub_login_user

      visit edit_admin_user_path(user)

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")
    end
  end
end
