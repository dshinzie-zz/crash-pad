require 'rails_helper'

describe "A logged in admin" do
  context "who clicks on all listings from the navbar" do
    it "sees all listings listed" do
      create_list :listing, 2
      first_listing = Listing.first
      second_listing = Listing.second

      stub_admin_user

      click_on "All Listings"

      expect(current_path).to eq(admin_listings_path)
      expect(page).to have_content(first_listing.id)
      expect(page).to have_content(second_listing.id)
    end
  end
end
describe "a logged in user" do
  context "without admin privilege" do
    it "cannot see admin listing info index" do
      user = stub_login_user

      visit admin_listings_path

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")
    end
  end
end
