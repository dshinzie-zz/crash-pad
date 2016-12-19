require 'rails_helper'

describe "As a logged in user" do
  context "When I create a valid lisiting" do
    it "stores lat and long" do
      user = stub_login_user

      visit new_listing_path

      fill_in "listing[city]", with: "Denver"
      fill_in "listing[address]", with: "1510 Blake Street"
      fill_in "listing[description]", with: "Test"
      fill_in "listing[price]", with: 99.00
      fill_in "listing[accomodation]", with: 2

      click_button "Create Listing"

      expect(current_path).to eq(listing_path(Listing.last))
      expect(Listing.last.latitude).to eq(39.7496354)
      expect(Listing.last.longitude).to eq(-105.0001058)
    end
  end

  context "When I enter an invalid address" do
    it "does not save bad address to the database" do
      user = stub_login_user

      visit new_listing_path

      fill_in "listing[city]", with: "blah"
      fill_in "listing[address]", with: ""
      fill_in "listing[description]", with: "Test"
      fill_in "listing[price]", with: 99.00
      fill_in "listing[accomodation]", with: 2

      click_button "Create Listing"

      expect(current_path).to eq(new_listing_path)
      expect(page).to have_content("Please enter a valid address")
      expect(Listing.count).to eq(0)
    end

    it "does not save blank address to the database" do
      user = stub_login_user

      visit new_listing_path

      fill_in "listing[city]", with: ""
      fill_in "listing[address]", with: ""
      fill_in "listing[description]", with: "Test"
      fill_in "listing[price]", with: 99.00
      fill_in "listing[accomodation]", with: 2

      click_button "Create Listing"

      expect(current_path).to eq(new_listing_path)
      expect(page).to have_content("Please enter a valid address")
      expect(Listing.count).to eq(0)
    end
  end

end
