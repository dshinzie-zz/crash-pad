require 'rails_helper'

describe 'As a verified user' do
  let!(:listing) { create(:listing, start_date: '1/1/2017', end_date: '5/1/2017') }
  context "when I book my own listing" do
    it "displays a flash message" do
      listing.user.update(verified: true)
      booking = Booking.new(
        start_date: "01/02/2017",
        end_date: "01/03/2017",
        credit_card_number: "1234432112344321"
        )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(listing.user)

      visit listings_path
      within(".listing-#{listing.id}") do
        click_on "Checkout listing"
      end

      click_on "Request to Book"

      fill_in 'booking_start_date', with: Listing.first.start_date
      fill_in 'booking_end_date', with: Listing.first.end_date
      fill_in 'booking_credit_card_number', with: booking.credit_card_number
      click_on "Submit Request"

      expect(page).to have_content("Booking failed!")
    end
  end

end
