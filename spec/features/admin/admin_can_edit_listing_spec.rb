require 'rails_helper'

describe "A logged in admin" do
  context "who edits a listing" do
    it "no longer sees deleted listing on index page" do
      create_list :listing, 1
      listing = Listing.first

      stub_admin_user

      visit admin_listing_path(listing)

      click_on "Edit Listing"
      fill_in "listing_city", with: "Denver"
      fill_in "listing_accomodation", with: 4
      click_on "Edit Listing"

      expect(current_path).to eq(admin_listing_path(listing))
      expect(page).to have_content("Denver")
      expect(page).to have_content("4")
    end
  end
end
