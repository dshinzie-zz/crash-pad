# require 'rails_helper'
#
# describe "As a not-logged in user" do
#   let!(:listing_1) { create(:listing, accomodation: 4, price: 0.99) }
#   let!(:listing_2) { create(:listing, accomodation: 2, price: 1.00) }
#
#   context "When I filter results by guests" do
#     it "should return results with only the amount of guests I entered", :js => true do
#
#       visit listings_path
#
#       fill_in "guests", with: 4
#       click_on "Filter"
#
#       expect(current_path).to eq(listings_path)
#       expect(page).to have_content(listing_1.price)
#       expect(page).to_not have_content(listing_2.price)
#     end
#   end
# end
