class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one_attached :avatar
  has_secure_password

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :avatar, blob: { content_type: :image, size_range: 1..(5.megabytes) }
  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL}, length: {maximum: 120}
  validates :password, presence: true

  before_save { self.email = email.downcase }
end