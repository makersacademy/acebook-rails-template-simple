class User < ApplicationRecord
  has_many :posts
  has_one_attached :image
  has_many :likes

  has_secure_password
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :image, presence: true
end
