class User < ApplicationRecord
  has_many :reviews
  has_many :movies, through: :reviews
  has_secure_password
  validates_uniqueness_of :name, message: "User already exists"
  validates_presence_of :name, :password, message: "can't be blank"
end
