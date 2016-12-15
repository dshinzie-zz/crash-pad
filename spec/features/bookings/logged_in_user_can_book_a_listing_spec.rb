require 'rails_helper'

describe 'As a logged in user' do
  context 'when I book a listing' do
    it "shows me a confirmation message" do
      let!(:listings) { create_list(:listing, 2) }
      let(:user) { create(:user) }

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit listings_path
      within(".listing-#{listings.first.id}") do
        click_on "Checkout listing"
      end
      fill_in '#listing-check-in', with: "01/02/2017"
      fill_in '#listing-check-out', with: "01/03/2017"
      select "2", from: '#listing-guest-select'
      click_on "Request to Book"

      expect(current_path).to eq(booking_path)
      expect(page).to have_content("Booking Information")
    end
  end
end
