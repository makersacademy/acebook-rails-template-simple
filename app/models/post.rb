class Post < ApplicationRecord
  has_one_attached :avatar
  
  def likes_count
    Like.count { |x| x[:post_id] == self.id }
  end
end
