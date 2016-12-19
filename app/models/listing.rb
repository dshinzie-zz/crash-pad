class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :nights

  validates :description, :price, :accomodation, :start_date, :end_date, presence: true

  after_create :set_default_photo

  def self.search(argument)
    return Listing.all if argument.nil?

    location = GeocodeLocation.get_location(argument)
    return {} if location == :bad_address

    if !location.address.nil?
      where(address: location.address)
    elsif !location.city.nil?
      where(city: location.city)
    elsif !location.state.nil?
      where(state: location.state)
    end
  end

  def concat_address
    "#{address} #{city} #{state}"
  end

  def self.featured
    order("created_at DESC").limit(3)
  end

  def set_default_photo
    self.update(image_url: ActionController::Base.helpers.image_path("apt#{rand(1..5)}.jpg"))
  end

  def create_nights(start_date, end_date)
    start_date.upto(end_date) do |date|
      Night.create(date: date, listing: self)
    end
  end

end
