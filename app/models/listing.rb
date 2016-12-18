class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :description, :price, :accomodation, presence: true

  # after_create :add_nights

  def self.search(argument)

    location = GeocodeLocation.get_location(argument)
    return {} if location == :bad_address

    if !location.address.nil?
      where(address: location.address)
    elsif !location.city.nil?
      where(city: location.city)
    elsif !location.state.nil?
      where(state: location.state)
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
