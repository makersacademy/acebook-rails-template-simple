class PostsController < ApplicationController
  def index
    @posts = Post.all
    json_response(@posts)
  end

  def create
  end

  def update
  end

  def delete
  end
end
