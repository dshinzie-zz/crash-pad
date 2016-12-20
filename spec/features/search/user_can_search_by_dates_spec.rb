require 'rails_helper'

describe "As a not logged in user" do
  context "when I enter a date in the check in and check out fields" do

    let!(:listing_1) { create(:listing, start_date: "1/1/2016", end_date: "7/1/2016", city: "Denver") }
    let!(:listing_2) { create(:listing, start_date: "1/1/2016", end_date: "3/1/2016", city: "Denver") }
    let!(:listing_3) { create(:listing, start_date: "1/1/2016", end_date: "5/1/2016", city: "Denver") }

    it "returns the listings within the check in and check out date" do
      visit root_path
      fill_in 'checkin', with: Date.parse('6/1/2016')
      fill_in 'checkout', with: Date.parse('7/1/2016')

      click_on "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listing_1.price)
      expect(page).not_to have_content(listing_2.price)
      expect(page).not_to have_content(listing_3.price)
    end
  end
end
