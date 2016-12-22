class HomeController < ApplicationController

  def index
    @listings = Listing.featured
    @booked_nights = Night.booked_nights
  end

end
