class User < ApplicationRecord
  include Clearance::User

  enum gender: [:undefined, :male, :female]

  has_many :authentications, :dependent => :destroy

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
