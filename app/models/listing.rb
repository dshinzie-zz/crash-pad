class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :nights
  has_many :ratings, dependent: :destroy

  validates :description, :price, :accomodation, :start_date, :end_date, presence: true

  after_create :set_default_photo, :create_nights

  def self.search(location, start_date, end_date)

    if (location && start_date.empty? ) || (location && end_date.empty?)
      return get_listing_by_location(location)

    elsif (location.empty? && start_date && end_date)
      return self.get_listing_by_date(start_date, end_date)

    elsif (location && start_date && end_date)
      return get_listing_by_location(location).get_listing_by_date(start_date, end_date)

    else
      return Listing.all
    end

  end

  def self.get_listing_by_location(location)
    return Listing.all if location.nil?

    geocode_location = GeocodeLocation.get_location(location)
    return {} if geocode_location == :bad_address

    if !geocode_location.address.nil?
      where(address: geocode_location.address)
    elsif !geocode_location.city.nil?
      where(city: geocode_location.city)
    elsif !geocode_location.state.nil?
      where(state: geocode_location.state)
    end
  end

  def self.get_listing_by_date(start_date, end_date)
    joins(:nights)
    .where("nights.date >= ? AND nights.date <= ?", start_date, end_date)
    .distinct
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
