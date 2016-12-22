class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :nights, :dependent => :delete_all
  has_many :ratings, dependent: :destroy

  validates :description, :price, :accomodation, :start_date, :end_date, presence: true

  after_create :set_default_photo, :create_nights

  def self.search(argument)
    return Listing.all if get_listing_collection(argument).class == Hash
    get_listing_collection(argument)
  end

  def self.get_listing_collection(argument)
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

  RATINGS = {1 => "Terrible", 2 => "Below_Average", 3 => "Mediocre",
             4 => "Above_Average", 5 => "Great"}

  def average_rating
    if ratings == []
      return "Unrated"
    else
      sum = ratings.map do |rating|
        rating.score_before_type_cast
      end
      value = (sum.reduce(:+)/ratings.count)
      return RATINGS[value]
    end
  end

  def set_default_photo
    self.update(image_url: ActionController::Base.helpers.image_path("apt#{rand(1..5)}.jpg"))
  end

  def create_nights
    self.start_date.upto(self.end_date) do |date|
      Night.create(date: date, listing: self)
    end
  end

end
