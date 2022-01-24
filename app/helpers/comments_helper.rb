module CommentsHelper

  def editable?(comment)
    Time.now - Time.parse(comment.created_at.to_s) <= 600
  end

end
