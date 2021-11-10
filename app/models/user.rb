class User < ApplicationRecord
include ImageUploader::Attachment(:image)
has_secure_password
  has_many :posts
validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }
end
