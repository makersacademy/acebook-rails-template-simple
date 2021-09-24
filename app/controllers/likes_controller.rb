class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)

    render(partial: 'posts/like',
      locals: { like: @like, post: Post.find(@like.post_id) }) and return
  end

  def index
    @likes = Like.all
  end

  def destroy
    @like = Like.find_by(user_id: like_params[:user_id],
      post_id: like_params[:post_id])
    post = Post.find(like_params[:post_id])

    @like.destroy

    render(partial: 'posts/like', locals: { post: post }) and return
  end

  private

  def like_params
    params.require(:like).permit(:id, :user_id, :post_id)
  end
end
