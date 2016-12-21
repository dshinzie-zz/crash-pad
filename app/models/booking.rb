class Booking < ApplicationRecord
  belongs_to :user
  has_many :nights

  before_create :valid_booking?

  attr_accessor :listing

  def book_nights
    self.start_date.upto(self.end_date) do |date|
      night = Night.find_by(date: date, listing: listing)
      night.update(booking: self)
    end
  end

  def valid_booking?
    self.start_date.upto(self.end_date) do |date|
      listing_date = find_night(date, listing)
      raise ActiveRecord::Rollback, "Invalid Booking" unless
        listing_date_validations(listing_date)
    end
  end

  def find_night(date, listing)
    Night.find_by(date: date, listing: listing)
  end

  def listing_date_validations(listing_date)
    listing_date &&
    listing_date.booking.nil? &&
    listing.user != self.user
  end

end
