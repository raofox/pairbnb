class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing.id
    if @reservation.save
      redirect_to root_path
    else
      # @errors = @reservation.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end


end
