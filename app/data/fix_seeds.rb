
def fix_seed_locations
  Listing.all.each do |listing|
    geocode_location = GeocodeLocation.get_location(listing.address)
    listing.update(geocode_location.attributes_for_update) if geocode_location != :bad_address

    puts "Listing #{listing.id} updated."
  end
end
