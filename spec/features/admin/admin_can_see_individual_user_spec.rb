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
