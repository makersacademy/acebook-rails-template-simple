class Post < ApplicationRecord
  scope :newest_first, -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :message, presence: true
end
