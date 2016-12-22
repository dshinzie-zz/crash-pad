require 'rails_helper'

describe 'Geocode service' do
  context 'when I pass in a location' do
    it "returns the results response", :vcr do
      address = "1510 Blake St Denver CO"
      geocode = GeocodeService.new.find_lat_long(address.parameterize)

      expect(geocode.class).to eq(Hash)
      expect(geocode).to have_key(:results)
    end
  end
end
