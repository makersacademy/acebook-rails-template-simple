class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { in: 8..40 }

  has_secure_password
end