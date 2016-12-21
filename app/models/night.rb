class Night < ApplicationRecord
  belongs_to :listing
  belongs_to :booking, optional: true

  validates :date, presence: true
end
