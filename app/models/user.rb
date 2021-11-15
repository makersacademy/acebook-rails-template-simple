class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  validates_uniqueness_of :email
end
