class ReservationMailer < ApplicationMailer
  default from: 'notifications@pairbnb.com'

  def reservation_email(reservation)   #changed booking_email to reservation_email
    @reservation = reservation
    mail(to: reservation.listing.user.email, subject: "Hey!!! You've got a reservation confirmed")
  end
end
