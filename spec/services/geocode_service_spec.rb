require 'rails_helper'

describe 'Geocode service' do
  context 'when I pass in a location' do
    it "returns lat and long" do
      address = "1321 E 12th Ave, Denver, CO"
      geocode = GeocodeService.new.find_lat_long(address.parameterize)
      geocode_location = geocode[:results].first[:geometry][:location]

      expect(geocode.class).to eq(Hash)
      expect(geocode  ).to have_key(:results)
      expect(geocode_location).to have_key(:lat)
      expect(geocode_location).to have_key(:lng)
    end
  end
end
