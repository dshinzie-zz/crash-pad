require 'securerandom'

class User < ActiveRecord::Base

  has_secure_password

  before_create :set_api_key

  validates :email, presence: true, uniqueness: true

  private

  def set_api_key
    return if api_key.present?
    self.api_key = generate_api_key
  end

  def generate_api_key
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
