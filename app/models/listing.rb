class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

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


end
