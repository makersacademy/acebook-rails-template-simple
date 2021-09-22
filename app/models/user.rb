class User < ApplicationRecord
  has_one_attached :avatar
  has_many :likes
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 8..40 }

  has_secure_password
end
