require 'rails_helper'

describe "A logged in admin" do
  context "who clicks on a listing" do
    it "sees information for said listing" do
      create_list :listing, 3
      first_listing = Listing.first
      second_listing = Listing.second
      third_listing = Listing.third
      id_before_delete = first_listing.id

      stub_admin_user

      visit admin_listing_path(first_listing)

      click_on "Delete Listing"

      expect(current_path).to eq(admin_listings_path)
      page.should_not have_xpath("//a[@href='/admin/listings/#{id_before_delete}']")
    end
  end
end
