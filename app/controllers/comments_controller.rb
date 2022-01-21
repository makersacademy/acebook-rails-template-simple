class CommentsController < ApplicationController
  before_action :find_post
  
  def create
    @post.comments.create(user_id: session[:current_user_id], content: "hello")
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find_by(id: 1)
  end

end
