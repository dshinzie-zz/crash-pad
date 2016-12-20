class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :description, :price, :accomodation, presence: true

  attr_accessor :start_date, :end_date

  after_create :set_default_photo

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
end
