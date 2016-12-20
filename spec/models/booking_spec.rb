require 'rails_helper'

RSpec.describe Booking, type: :model do
  let!(:listing) { create(:listing, start_date: '1/1/2017', end_date: '5/1/2017') }

  context 'relationships' do
    it { should belong_to(:user) }
  end

  context '#book_nights' do
    it "adds booking id to each night" do
      booking = create(:booking, start_date: '1/1/2017', end_date: '5/1/2017')

      booking.book_nights(booking.start_date, booking.end_date, listing)

      expect(booking.nights.count).to eq(5)
      expect(booking.nights.first.listing).to_not eq(nil)
      expect(booking.nights.last.listing).to_not eq(nil)
    end
    it "returns a warning for a booking outside the valid range" do
      invalid_booking = create(:booking, start_date: '1/1/2017', end_date: '6/1/2017')

      invalid_booking.book_nights(invalid_booking.start_date, invalid_booking.end_date, listing)

      expect(invalid_booking.nights.count).to eq(0)
      # expect(invalid_booking).to eq("Invalid booking")
    end
  end
end
