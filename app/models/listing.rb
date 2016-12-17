class Listing < ApplicationRecord
  belongs_to :user

  validates :description, :price, :accomodation, presence: true

  attr_accessor :address

end
