class User < ApplicationRecord
  # has_many :posts
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, length: {:within => 8..20}
  validates :name, presence: true 
end