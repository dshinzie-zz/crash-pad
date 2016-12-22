require 'rails_helper'

describe 'As a verified logged in user' do
  let!(:listing) { create(:listing, start_date: "01/02/2017", end_date: "01/03/2017") }
  let!(:user) { create(:user, verified: true) }
  context 'when I click bookings' do
    it "bookings are displayed" do

    booking = Booking.create(start_date: "01/02/2017", end_date: "01/03/2017", credit_card_number: "1234432112344321", user: user, listing: listing)

      booking.book_nights

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_on "My Bookings"
      
      expect(current_path).to eq(user_bookings_path(user))
      expect(page).to have_content(booking.start_date.strftime("%d/%m/%Y"))
      expect(page).to have_content(booking.end_date.strftime("%d/%m/%Y"))
    end
  end
end
