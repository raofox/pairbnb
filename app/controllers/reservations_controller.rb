class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing.id
    if @reservation.save
      flash[:success] = @reservation.errors.full_messages.join
      redirect_to listing_reservation_path(@reservation, listing_id: @listing.id)
    else

      flash[:danger] = @reservation.errors.full_messages.join
      render "listings/show"
    end
  end

  def destroy
  end


  def show
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end


end
