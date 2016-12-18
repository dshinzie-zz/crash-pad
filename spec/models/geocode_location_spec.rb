require 'rails_helper'

describe "GeocodeLocation" do
  context ".get_location(address)" do
    it "returns location information of address" do
      address = "1510 Blake St Denver CO"
      location = GeocodeLocation.get_location(address)

      expect(location).to be_a(GeocodeLocation)
      expect(location).to respond_to(:address)
      expect(location).to respond_to(:city)
      expect(location).to respond_to(:state)
      expect(location).to respond_to(:latitude)
      expect(location).to respond_to(:longitude)

    end
  end
end
