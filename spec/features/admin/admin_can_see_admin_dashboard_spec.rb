require 'rails_helper'

describe "As a not logged in admin" do
  context "when I log in as admin" do
    it "should show me the admin dashboard" do
      admin = stub_admin_user

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content ("All Users")
      expect(page).to have_content ("All Listings")

    end
  end
end
describe "As a not logged in user" do
  context "when I log in as user" do
    it "should not show me the admin dashboard" do
      user = stub_login_user

      visit admin_dashboard_path

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")
    end
  end
end
