class Post < ApplicationRecord
  has_many :likes

  def likes_count
    Like.count { |x| x[:post_id] == self.id }
  end
end
