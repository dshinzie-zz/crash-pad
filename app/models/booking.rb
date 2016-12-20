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
      raise ActiveRecord::Rollback, "Invalid Booking" unless
        Night.find_by(date: date, listing: listing) &&
        Night.find_by(date: date, listing: listing).booking.nil?
    end
  end

end
