require 'rails_helper'

describe "as a not logged in user" do
  context "when I enter a criteria and click search" do

    let!(:listings) { create_list(:listing, 2, city: "Denver") }

    it "should return all listings within the criteria" do
      # when I visit '/'
      visit root_path
      # and I fill in search bar with Denver
      fill_in :q, with: "Denver"
      # and I click search
      click_button "Search"
      # I should be at listings index page
      expect(current_path).to eq(listings_path)
      # I should see first listing with location of Denver
      expect(page).to have_content(listings.first.city)
      # and last listing with location of Denver
      expect(page).to have_content(listings.last.city)

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
