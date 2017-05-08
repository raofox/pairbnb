class ReservationJob < ApplicationJob
  queue_as :default

  def perform(email)
    # Do something later
    byebug
    ReservationMailer.reservation_email(email).deliver_later
  end
end
