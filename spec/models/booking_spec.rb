require 'rails_helper'

RSpec.describe Booking, type: :model do
  let!(:listing) { create(:listing, start_date: '1/1/2017', end_date: '5/1/2017') }

  context 'relationships' do
    it { should belong_to(:user) }
  end

  context '#book_nights' do
    it "adds booking id to each night" do
      booking = create(:booking, start_date: '1/1/2017', end_date: '5/1/2017', listing: listing)

      booking.book_nights

      expect(booking.nights.count).to eq(5)
      expect(booking.nights.first.listing).to_not eq(nil)
      expect(booking.nights.last.listing).to_not eq(nil)
    end
    it "returns a warning for a booking outside the valid range" do
      booking = Booking.create(
              user: create(:user),
              start_date: '1/1/2017',
              end_date: '6/1/2017',
              credit_card_number: '1234',
              listing: listing
            )

      expect(booking.id).to eq(nil)
    end
    it "prevents a user from double booking" do
      booking1 = Booking.create(
              user: create(:user),
              start_date: '1/1/2017',
              end_date: '5/1/2017',
              credit_card_number: '1234',
              listing: listing
            )
      booking1.book_nights

      booking2 = Booking.create(
              user: create(:user),
              start_date: '1/1/2017',
              end_date: '5/1/2017',
              credit_card_number: '5678',
              listing: listing
            )
      expect(booking2.id).to eq(nil)
    end
  end
end
