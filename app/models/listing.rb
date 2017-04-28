class Listing < ApplicationRecord

  belongs_to :user

  enum property_type: [:house, :apartment, :bungalow]
  enum room_type: [:shared_room, :private_room, :entire_place]


end
