class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlap

  def check_overlap
    listing.reservations.each do |existing_reservation|
      if overlap?(self, existing_reservation)
        return errors.add(:overlap, "The are existing reservations for
          the dates you have selected.")
      end
    end
  end


  def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

end
