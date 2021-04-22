class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_comments_path(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order('created_at').reverse_order
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :post_id)
  end
end
