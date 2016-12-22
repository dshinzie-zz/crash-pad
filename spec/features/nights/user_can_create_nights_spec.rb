require 'rails_helper'

describe 'As a verified user creating a listing' do
  context 'when I enter start and end dates' do
    it "creates nights for my listing" do
      user = stub_login_user

      user.update(verified: true)

      dates = { start_date: '1/1/2017', end_date: '5/1/2017' }

      visit new_listing_path

      fill_in "listing[city]", with: "Denver"
      fill_in "listing[address]", with: "1510 Blake Street"
      fill_in "listing[description]", with: "Test"
      fill_in "listing[price]", with: 99.00
      fill_in "listing[accomodation]", with: 2
      fill_in "listing[start_date]", with: dates[:start_date]
      fill_in "listing[end_date]", with: dates[:end_date]
      click_button "Create Listing"

      listing_created = user.listings.first

      expect(listing_created.nights.first.date).to eq(Date.parse(dates[:start_date]))
      expect(listing_created.nights.last.date).to eq(Date.parse(dates[:end_date]))
      expect(listing_created.nights.count).to eq(5)
    end
  end
end
describe 'As an unverified user' do
    it "I cannot create a listing" do
      user = stub_login_user

      dates = { start_date: '1/1/2017', end_date: '5/1/2017' }

      visit new_listing_path

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")

  end
end
