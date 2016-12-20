class RatingsController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    # rating = listing.ratings.find(params[:id])
    listing.ratings.create(rating_params)

    redirect_to listing_path(listing)
  end


  private

  def rating_params
    params.permit(:score, :user_id, :listing_id)
  end
end
