require 'rails_helper'

describe "A logged in admin" do
  context "who clicks on all users from the navbar" do
    it "sees all users listed" do
      create_list :user, 3
      first_user = User.first
      third_user = User.third

      admin = stub_admin_user

      click_on "All Users"

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content("#{first_user.email}")
      expect(page).to have_content("#{third_user.email}")

    end
  end
end
