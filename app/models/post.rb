class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_one_attached :image

  def liked?(user)
    !!self.likes.find { |like| like.user_id == user.id }
  end
end
