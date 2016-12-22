require 'rails_helper'

describe "As a not logged in user" do
  context "when I enter a date in the check in and check out fields" do

    let!(:listing_1) { create(:listing, start_date: "1/1/2016", end_date: "7/1/2016", city: "Denver") }
    let!(:listing_2) { create(:listing, start_date: "1/1/2016", end_date: "3/1/2016", city: "Denver") }
    let!(:listing_3) { create(:listing, start_date: "1/1/2016", end_date: "5/1/2016", city: "Austin") }

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

    it "returns the listings within the check in and check out date" do
      visit root_path
      fill_in 'checkin', with: Date.parse('4/1/2016')
      fill_in 'checkout', with: Date.parse('5/1/2016')

      click_on "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listing_1.price)
      expect(page).to have_content(listing_3.price)
      expect(page).not_to have_content(listing_2.price)
    end

    it "returns no listings if dates are invalid" do
      visit root_path
      fill_in 'checkin', with: Date.parse('1/1/2016')
      fill_in 'checkout', with: Date.parse('10/1/2016')

      click_on "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content("No Available Listings")
    end

    it "returns correct listing with valid city and date" do
      visit root_path
      fill_in "q", with: "Austin"
      fill_in 'checkin', with: Date.parse('2/1/2016')
      fill_in 'checkout', with: Date.parse('5/1/2016')

      click_on "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listing_3.price)
      expect(page).to_not have_content(listing_2.price)
      expect(page).to_not have_content(listing_1.price)
    end

    it "returns no listings with invalid city and correct date" do
      visit root_path
      fill_in "q", with: "Midland"
      fill_in 'checkin', with: Date.parse('2/1/2016')
      fill_in 'checkout', with: Date.parse('5/1/2016')

      click_on "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content("No Available Listings")
    end

    it "returns no listings with valid city and incorrect date" do
      visit root_path
      fill_in "q", with: "Denver"
      fill_in 'checkin', with: Date.parse('9/1/2016')
      fill_in 'checkout', with: Date.parse('20/1/2016')

      click_on "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content("No Available Listings")
    end
  end
end
