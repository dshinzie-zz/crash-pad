class User < ActiveRecord::Base
  include ApiKey

  has_many :listings
  has_secure_password
  before_create :get_api_key
  validates :email, presence: true, uniqueness: true

  private

  def get_api_key
    self.api_key = ApiKey.generate
  end
end
