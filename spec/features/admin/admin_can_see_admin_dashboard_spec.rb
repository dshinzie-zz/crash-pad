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
