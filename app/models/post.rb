class Post < ApplicationRecord
  # belongs_to :user
  has_one_attached :post_photo
  validates :content, presence: true, length: { minimum: 10 }
  validates :users_id, presence: true
  has_many :likes, dependent: :destroy

end
