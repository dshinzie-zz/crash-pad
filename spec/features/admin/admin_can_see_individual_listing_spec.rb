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
