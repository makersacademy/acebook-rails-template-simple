class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, unless: Proc.new { |user| user.password.blank? }

    has_many :posts
    has_many :comments
    has_many :likes
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    
    has_one_attached :profile_picture
end
