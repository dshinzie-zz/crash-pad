class Night < ApplicationRecord
  belongs_to :listing
  belongs_to :booking, optional: true
  # belongs_to :trip

  validates :date, presence: true
end
