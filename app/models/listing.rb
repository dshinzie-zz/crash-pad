class Listing < ApplicationRecord
  belongs_to :user

  validates :description, :price, :accomodation, presence: true
end
