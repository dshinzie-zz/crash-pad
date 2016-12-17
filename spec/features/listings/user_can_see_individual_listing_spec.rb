require 'rails_helper'

describe 'As a logged-out user' do
  let!(:listings) { create_list(:listing, 2) }

  context 'when I click checkout listing' do
    it "sees an individual listing" do
      visit root_path
      click_on "Take a Trip"

      within(".listing-#{listings.first.id}") do
        click_on "Checkout listing"
      end

      expect(current_path).to eq(listing_path(listings.first))
      expect(page).to have_content(listings.first.description)
      expect(page).to have_content(listings.first.price)
      expect(page).to have_content(listings.first.accomodation)
    end
  end
end

describe 'As a logged-in' do
  context 'when I click take a trip' do
    it "see all trips" do
      listings = create_list(:listing, 2)

      stub_login_user

      visit listings_path

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listings.first.description)
      expect(page).to have_content(listings.second.description)
    end
  end
end
