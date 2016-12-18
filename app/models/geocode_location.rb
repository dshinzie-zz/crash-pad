class GeocodeLocation

  attr_reader :address, :city, :state, :latitude, :longitude

  def initialize(attributes={})

    base_response = attributes[:results].first
    @address = get_location_component(base_response, :address) || nil
    @city = get_location_component(base_response, :city) || nil
    @state = get_location_component(base_response, :state) || nil
    @latitude = get_location_component(base_response, :latitude) || nil
    @longitude = get_location_component(base_response, :longitude) || nil
  end

  def self.get_location(address)
    service = GeocodeService.new.find_lat_long(address)
    if service[:status] == "OK"
      GeocodeLocation.new(service)
    else
      :bad_address
    end
  end

  def get_location_component(response, component)
    case component
    when :city && type_exists?(response, "locality")
      address_response(response, "locality")
    when :state && type_exists?(response, "administrative_area_level_1")
      address_response(response, "administrative_area_level_1")
    when :address && type_exists?(response, "street_number")
      address_response(response, "street_number") + address_response(response, "route")
    when :latitude &&
      response[:geometry][:location][:lat]
    when :longitude
      response[:geometry][:location][:lng]
    end
  end

  def address_response(response, type)
    response[:address_components].select do |datum|
      datum[:types].include?(type)
    end.first[:short_name]
  end

  def type_exists?(response, type)
    !response[:address_components].select do |datum|
      datum[:types].include?(type)
    end.empty?
  end

  def attributes_for_update
    {
      address: address,
      city: city,
      state: state,
      latitude: latitude,
      longitude: longitude
    }
  end

end
