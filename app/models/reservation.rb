class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlap
  validate :available?

  def check_overlap
    listing.reservations.each do |existing_reservation|
      if overlap?(self, existing_reservation)
        return errors.add(:Sorry, "There are existing reservations for
          the dates you have selected.")
      end
    end
  end


  def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end


  def total_price
    price = self.listing.price
    days = (self.start_date..self.end_date).to_a.length
   return  price * days
  end


  def available?
    self.errors.add(:start_date, "You can only make reservations from #{Date.today} onwards.") if self.end_date < Date.today
  end

end
