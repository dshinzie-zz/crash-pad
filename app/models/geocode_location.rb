class GeocodeLocation

  attr_reader :address, :city, :state, :latitude, :longitude

  def initialize(attributes={})
    base_response = attributes[:results].first
    @address = base_response[:address_components].first[:short_name] + base_response[:address_components].second[:short_name]
    @city = base_response[:address_components].fourth[:short_name]
    @state = base_response[:address_components][5][:short_name]
    @latitude = base_response[:geometry][:location][:lat]
    @longitude = base_response[:geometry][:location][:lng]
  end

  def self.get_location(address)
    service = GeocodeService.new.find_lat_long(address)
    if service[:status] == "OK"
      GeocodeLocation.new(service)
    else
      :bad_address
    end
  end
end
