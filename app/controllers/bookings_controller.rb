class BookingsController < ApplicationController

  before_filter :require_verified, only: [:new, :create]

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
    @booked_nights = Night.booked_nights
  end

  def create
    @booking = current_user.bookings.new(all_params)
    if @booking.save
      @booking.book_nights
      redirect_to user_booking_path(@booking.user, @booking)
    else
      flash[:danger] = "Booking failed!"
      redirect_to new_listing_booking_path(@booking.listing)
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @listing = Listing.of_booking(@booking)
  end

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :credit_card_number)
  end

  def all_params
    booking_params.merge({listing: Listing.find(params[:listing_id])})
  end

  def require_verified
    render plain: 'Not Found', status: '404' unless is_verified?
  end

end
