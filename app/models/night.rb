class Night < ApplicationRecord
  belongs_to :listing
  belongs_to :booking, optional: true
  # belongs_to :trip

  validates :date, presence: true

  def self.booked_nights
    where("booking_id is not null")
  end

end
