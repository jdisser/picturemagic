class User < ActiveRecord::Base
  has_secure_password
  has_many :albums, dependent: :destroy
  has_many :pictures, through: :albums
end
