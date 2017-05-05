class User < ApplicationRecord
  include Clearance::User

  enum gender: [:undefined, :male, :female]
  # enum role: {"superadmin"=>0, "moderator"=>1, "customer"=>2}
  enum role: [:superadmin, :moderator, :customer]

  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :reservations, :dependent => :destroy


  mount_uploader :avatar, AvatarUploader

  def password_optional?
	    true
	end

  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
      # user = User.create!(fullname: auth_hash["extra"]["raw_info"]["name"], email: auth_hash["extra"]["raw_info"]["email"], gender: auth_hash["extra"]["raw_info"]["gender"])
      u.fullname = auth_hash["extra"]["raw_info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.gender = auth_hash["extra"]["raw_info"]["gender"]
      u.authentications << (authentication)
      u.password = SecureRandom.hex(7)
    end
  end


  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end


end
