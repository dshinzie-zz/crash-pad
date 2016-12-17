require 'rails_helper'

describe "as a logged in user" do
  it "stores lat and long" do
    user = stub_login_user

    visit new_listing_path

    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Address", with: "1510 Blake Street"
    fill_in "Description", with: "Test"
    fill_in "Price", with: 99.00
    fill_in "Accomodation", with: 2

    click_button "Create Listing"

    expect(current_path).to eq(listing_path(Listing.last))
    expect(Listing.last.latitude).to eq(39.7496354)
    expect(Listing.last.longitude).to eq(-105.0001058)
  end
end
