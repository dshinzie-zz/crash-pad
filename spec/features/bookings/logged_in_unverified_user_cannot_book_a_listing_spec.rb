describe 'As an unverified logged in user' do
  let!(:listing) { create(:listing, start_date: "01/02/2017", end_date: "01/03/2017") }
  let(:user) { create(:user) }

  context 'when I attempt to book a listing' do
    it "shows me an error page" do

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

      expect(page).to have_http_status(404)
      expect(page).to have_content("Not Found")
    end
  end
end
