class AddBookingidToNights < ActiveRecord::Migration[5.0]
  def change
    add_reference :nights, :booking, foreign_key: true
  end
end
