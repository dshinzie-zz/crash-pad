require 'rails_helper'

RSpec.describe User, type: :model do
  context "no email address is provided" do
    it "user account is not created" do
      invalid_user = User.new(password: "pass")

      expect(invalid_user).to be_invalid
    end
  end
  context "no password is provided" do
    it "user account is not created" do
      invalid_user = User.new(email: "green@brad.com")

      expect(invalid_user).to be_invalid
    end
  end
  context "email already exists" do
    it "user account is not created" do
      User.create(email: "green@brad.com", password: "pass")
      imposter = User.new(email: "green@brad.com", password: "slimshady")

      expect(imposter).to be_invalid
    end
  end
  context "unique email and password are provided" do
    it "user account is created" do
      valid_user = User.new(email: "real@email.com", password: "pass")

      expect(valid_user).to be_valid
    end
  end
end
