module LikesHelper
  def likes_count(post)
    likes = post.likes.count
    likes < 2 ? "#{likes} Like" : "#{likes} Likes"
  end
end
