class User < ActiveRecord::Base
  include ApiKey

  has_many :listings
  has_many :bookings
  has_many :reviews
  has_many :ratings, dependent: :destroy
  has_secure_password
  before_create :get_api_key
  after_create :generate_slug
  validates :email, presence: true, uniqueness: true
  validates :slug, uniqueness: true
  validates_presence_of :first_name, :last_name, :phone

  def generate_slug
    self.update(slug: email.parameterize.gsub("-", ""))
  end

  private

  def get_api_key
    self.api_key = ApiKey.generate
  end

end
