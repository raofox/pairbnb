class Listing < ApplicationRecord

  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags


  enum property_type: [:house, :apartment, :bungalow]
  enum room_type: [:shared_room, :private_room, :entire_place]


end
