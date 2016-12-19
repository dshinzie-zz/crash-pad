class ListingsController < ApplicationController

  def index
    @listings = Listing.search(params[:q])
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    location = GeocodeLocation.get_location(listing_address)
    return bad_address unless valid_location?(location)

    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      @listing.update(location.attributes_for_update)
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  private

    def bad_address
      redirect_to new_listing_path
      flash[:danger] = "Please enter a valid address"
    end

    def valid_location?(location)
      location.class == GeocodeLocation
    end

    def listing_params
      params.require(:listing).permit(:city, :state, :address, :description, :price, :accomodation)
    end

    def listing_address
      params.require(:listing).permit(:address, :city, :state).values.join(" ")
    end

end
