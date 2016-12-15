require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:phone)}

  context "no email address is provided" do
    it "user account is not created" do
      invalid_user = User.new(password: "pass", first_name: "chase", last_name: "dun", phone: "7273840")

      expect(invalid_user).to be_invalid
    end
  end
  context "no password is provided" do
    it "user account is not created" do
      invalid_user = User.new(email: "green@brad.com", first_name: "chase", last_name: "dun", phone: "7273840")

      expect(invalid_user).to be_invalid
    end
  end
  context "email already exists" do
    it "user account is not created" do
      User.create(email: "green@brad.com", password: "pass", first_name: "chase", last_name: "dun", phone: "7273840")
      imposter = User.new(email: "green@brad.com", password: "slimshady", first_name: "chase", last_name: "dun", phone: "7273840")

      expect(imposter).to be_invalid
    end
  end
  context "unique email and password are provided" do
    it "user account is created" do
      valid_user = User.new(email: "real@email.com", password: "pass", first_name: "chase", last_name: "dun", phone: "7273840")

      expect(valid_user).to be_valid
    end
  end
  context "when user is created" do
    it "generates an api_key" do
      valid_user = User.create(email: "real@email.com", password: "pass", first_name: "chase", last_name: "dun", phone: "7273840")

      expect(valid_user.api_key).to_not eq(nil)
    end
  end
end
