class Post < ApplicationRecord
  # belongs_to :user
  has_one_attached :post_photo
  validates :content, presence: true, length: { maximum: 150 }
  validates :users_id, presence: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
