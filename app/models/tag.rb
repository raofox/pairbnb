class Tag < ApplicationRecord

  has_many :listing_tags
  has_many :listings, through: :listing_tags

  scope :amenity, -> (goodies) { where amenity: goodies }


end
