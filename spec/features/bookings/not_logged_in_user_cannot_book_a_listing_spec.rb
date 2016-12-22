describe 'As a not logged in user' do
  let!(:listing) { create(:listing, start_date: "01/02/2017", end_date: "01/03/2017") }

  context 'when I view an individual listing' do
    it "the request booking button is disabled" do

      visit listings_path
      within(".listing-#{listing.id}") do
        click_on "Checkout listing"
      end

      expect(page).to have_button('Request to Book', disabled: true)

    end
  end
end
