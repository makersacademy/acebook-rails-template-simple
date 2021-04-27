class LikesController < ApplicationController
  before_action :find_post

  # def new
  #   @likes = Like.new
  # end

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to root_url
  end
  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
