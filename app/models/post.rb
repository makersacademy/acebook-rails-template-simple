class Post < ApplicationRecord
  # belongs_to :user
  validates :content, presence: true, length: { minimum: 10 }

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
