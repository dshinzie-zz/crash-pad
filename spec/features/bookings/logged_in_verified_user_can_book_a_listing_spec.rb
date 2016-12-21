require 'rails_helper'

describe 'As a logged in user' do
  let!(:listing) { create(:listing, start_date: "01/02/2017", end_date: "01/03/2017") }
  let(:user) { create(:user) }

  context 'when I book a listing' do
    it "shows me a confirmation message" do

      booking = Booking.new(
        start_date: "01/02/2017",
        end_date: "01/03/2017",
        credit_card_number: "1234432112344321"
        )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit listings_path
      within(".listing-#{listing.id}") do
        click_on "Checkout listing"
      end

      click_on "Request to Book"

      fill_in 'booking_start_date', with: Listing.first.start_date
      fill_in 'booking_end_date', with: Listing.first.end_date
      fill_in 'booking_credit_card_number', with: booking.credit_card_number
      click_on "Submit Request"

      expect(current_path).to eq(user_booking_path(user, Booking.first))
      expect(page).to have_content(booking.start_date.strftime("%d/%m/%Y"))
      expect(page).to have_content(booking.end_date.strftime("%d/%m/%Y"))
    end
  end
end
