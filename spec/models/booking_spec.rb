require 'rails_helper'

RSpec.describe Booking, type: :model do

  context 'relationships' do
    it { should belong_to(:user) }
  end

  context '#book_nights' do
    it "adds booking id to each night" do
      listing = create(:listing, start_date: '1/1/2017', end_date: '5/1/2017')
      booking = create(:booking, start_date: '1/1/2017', end_date: '5/1/2017')

      booking.book_nights(booking.start_date, booking.end_date, listing)

      expect(booking.nights.count).to eq(5)
      expect(booking.nights.first.listing).to_not eq(nil)
      expect(booking.nights.last.listing).to_not eq(nil)
    end
  end
end
