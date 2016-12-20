class Booking < ApplicationRecord
  belongs_to :user
  has_many :nights

  def book_nights(start_date, end_date, listing)
    if valid_booking?(start_date, end_date, listing)
      start_date.upto(end_date) do |date|
        night = Night.find_by(date: date, listing: listing)
        night.update(booking: self)
      end
    else
      "Invalid booking"
    end
  end

  def valid_booking?(start_date, end_date, listing)
    start_date.upto(end_date) do |date|
      return false unless Night.find_by(date: date, listing: listing)
    end
  end

end
