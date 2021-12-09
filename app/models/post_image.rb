class PostImage < ApplicationRecord
  has_one_attached :image
  validates :title, :content, presence: true
  validates :title, length: { minimum: 5, maximum: 25 }
  validates :content, length: { minimum: 5, maximum: 50 }
end
