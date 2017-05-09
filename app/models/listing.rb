class Listing < ApplicationRecord

  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  has_many :reservations, :dependent => :destroy


  enum property_type: [:house, :apartment, :bungalow]
  enum room_type: [:shared_room, :private_room, :entire_place]


  mount_uploaders :photos, PhotoUploader
  # serialize :photos, JSON


  scope :min_max_price, -> (min,max) { where('price > ? AND price < ?', min, max) }
  scope :address, -> (location) { where address: location }
  scope :bedroom, -> (num_of_bedroom) { where bedroom: num_of_bedroom }
  scope :bathroom, -> (num_of_bathroom) { where bathroom: num_of_bathroom }


end
