require 'rails_helper'

describe "as a not logged in user" do
  context "when I enter a criteria and click search" do

    let!(:listings) { create_list(:listing, 2, state: "CO", city: "Denver") }

    it "should return all listings within the criteria" do
      visit root_path

      fill_in :q, with: "Denver"

      click_button "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listings.first.city)
      expect(page).to have_content(listings.last.city)
    end
  end

  context "when I enter a criteria with no listings and click Search" do
    it "should return a message indicating no results" do
      visit root_path

      fill_in :q, with: "testestest"

      click_button "Search"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content("No Available Listings")
    end
  end
end
#
#
# click search
# hit controller with params
# hit model with params
# search database with params
# return to model with params
# # for each record
# #   put in JS array for markers
# display each record sorted by listing start date
# # display map with markers
