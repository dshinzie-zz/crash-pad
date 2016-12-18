class GeocodeLocation

  attr_reader :address, :city, :state, :latitude, :longitude

  def initialize(attributes={})

    base_response = attributes[:results].first
    # @address = base_response[:address_components].first[:short_name] + base_response[:address_components].second[:short_name]
    # @city = base_response[:address_components].fourth[:short_name]
    @state = get_location_component(base_response, :state) || nil#base_response[:address_components][5][:short_name]
    require "pry"; binding.pry
    # @latitude = base_response[:geometry][:location][:lat]
    # @longitude = base_response[:geometry][:location][:lng]
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
    when :city
      address_response(response, "locality")
    when :state
      address_response(response, "administrative_area_level_1")
    when :address
      address_response(response, "street_number") + address_response(response, "route")
    when :latitude
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

end
