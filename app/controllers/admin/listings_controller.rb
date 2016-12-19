class Admin::ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:success] = "Listing #{@listing.id} successfully deleted!"
    redirect_to admin_listings_path
  end

end
