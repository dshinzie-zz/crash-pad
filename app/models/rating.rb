class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  enum score: %w(Unrated Terrible Below_Average Mediocre Above_Average Great)
end
