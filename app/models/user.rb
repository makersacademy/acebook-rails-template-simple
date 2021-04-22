class User < ApplicationRecord
  validates :forename, presence: true
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
end
