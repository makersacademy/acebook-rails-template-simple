class Post < ApplicationRecord
  # belongs_to :user
  has_one_attached :post_photo
  validates :content, presence: true, length: { minimum: 10 }
end
