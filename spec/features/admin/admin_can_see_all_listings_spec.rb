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
