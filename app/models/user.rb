class User < ApplicationRecord
  has_one_attached :profile_pic
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true, format: { with: /\A[a-zA-Z ,.'-]+$\z/i } 
  validates :email, presence: true, length: { in: 5..30 }, uniqueness: true
  validates :password, presence: true, length: { in: 5..15 }
end
