require 'securerandom'

module ApiKey
  def self.generate
    SecureRandom.hex
  end
end
