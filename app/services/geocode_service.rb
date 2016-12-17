class GeocodeService

  def find_lat_long(address)
    response = conn.get( '/maps/api/geocode/json', { address: address } )
    JSON.parse(response.body, symbolize_names: true)[:results].first[:geometry][:location]
  end

  private

  def conn
    conn = Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params[:key] = ENV['GOOGLE_MAPS_API']
    end
  end

end
