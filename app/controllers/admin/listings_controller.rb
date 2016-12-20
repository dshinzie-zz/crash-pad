class Admin::ListingsController < Admin::BaseController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:success] = "Listing successfully updated!"
      redirect_to admin_listing_path(@listing)
    else
      redirect_to edit_admin_listing_path(@listing)
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:success] = "Listing #{@listing.id} successfully deleted!"
    redirect_to admin_listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:description, :image_url, :price, :accomodation, :city, :state)
  end

end
