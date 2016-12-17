class User < ActiveRecord::Base
  include ApiKey

  has_many :listings
  has_many :bookings
  has_secure_password
  before_create :get_api_key
  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name, :phone

  enum role: [ :user, :admin ]

  private

    def get_api_key
      self.api_key = ApiKey.generate
    end
end
