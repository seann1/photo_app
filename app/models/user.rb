class User < ActiveRecord::Base
  has_many :tags
  has_many :photos, through: :tags
  validates_uniqueness_of :email
  has_secure_password
end

