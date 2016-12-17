class ReviewsController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    review = listing.reviews.create(review_params)
    review.user_id = current_user.id
    review.save
    redirect_to listing_path(listing)
  end

  def destroy
    listing = Listing.find(params[:listing_id])
    listing.reviews.delete(params[:id])
    redirect_to listing_path(listing)
  end

  private

  def review_params
    params.require(:review).permit(:body, :user_id, :listing_id)
  end
end
