class WelcomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
    @comment = Comment.new 
    @likes = Like
  end

end
