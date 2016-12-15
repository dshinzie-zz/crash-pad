class User < ActiveRecord::Base
  include ApiKey

  has_many :listings
  has_secure_password
  before_create :get_api_key
  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name, :phone

  private

  def get_api_key
    self.api_key = ApiKey.generate
  end
end
