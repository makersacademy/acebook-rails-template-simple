class User < ApplicationRecord
  has_many :posts
  has_secure_password
  has_one_attached :avatar
end
