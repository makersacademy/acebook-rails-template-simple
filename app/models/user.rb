class User < ApplicationRecord
  has_secure_password
  validates :forename, presence: true
  # validation for username and email address
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
end
