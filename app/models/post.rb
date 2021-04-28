class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  has_one_attached :image
  validates :message, presence: true
end
