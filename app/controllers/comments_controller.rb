class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_comments(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order('created_at').reverse_order
  end

  private
  def comment_params
      params.require(:comment).permit(:user, :body, :post)
  end
end
