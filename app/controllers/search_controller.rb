class SearchController < ApplicationController
  def index
    if params
    @listings = Listing.where()
  end
end
