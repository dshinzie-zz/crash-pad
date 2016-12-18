class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :description, :price, :accomodation, presence: true

  attr_accessor :address

  def self.search(argument)
    if argument
      where(city: argument)
    else
      Listing.all
    end
  end

  def concat_address
    "#{city}"
  end

  def self.featured
    order("created_at DESC").limit(3)
  end

end
