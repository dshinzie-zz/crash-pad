require 'rails_helper'

describe "A logged in admin" do
  context "who clicks on a listing" do
    it "sees information for said listing" do
      create_list :listing, 2
      first_listing = Listing.first
      second_listing = Listing.second

      stub_admin_user

      visit admin_listings_path
      within ".listing-#{first_listing.id}" do
        find(:xpath, "//a[@href='/admin/listings/#{first_listing.id}']").click
      end

      expect(current_path).to eq(admin_listing_path(first_listing))

      expect(page).to have_content(first_listing.user_id)
      expect(page).to have_content(first_listing.description)
      expect(page).to have_content(first_listing.price)
      expect(page).to have_content(first_listing.accomodation)
    end
  end
end
describe "A logged in user" do
  context "without admin privilege" do
    it "cannot see admin listing information" do
      create_list :listing, 1
      listing = Listing.first

      user = stub_login_user

      visit admin_listing_path(listing)

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")
    end
  end
end
