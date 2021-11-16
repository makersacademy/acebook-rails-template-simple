class WelcomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
  end

end
