require 'rails_helper'

describe "A logged in admin" do
  context "who clicks on a specific user" do
    it "sees user information" do
      create_list :user, 3
      first_user = User.first
      third_user = User.third

      admin = stub_admin_user

      visit admin_users_path

      within ".user-#{first_user.id}" do
        find(:xpath, "//a[@href='/admin/users/#{first_user.id}']").click
      end

      expect(current_path).to eq(admin_user_path(first_user))

      expect(page).to have_content(first_user.created_at)
    end
  end
end
describe "A logged in user" do
  context "without admin privilege" do
    it "cannot see admin user information" do
      create_list :user, 1
      first_user = User.first

      user = stub_login_user

      visit admin_user_path(first_user)

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")
    end
  end
end
