class HomeController < ApplicationController

  def index
    @listings = Listing.featured
  end

end
