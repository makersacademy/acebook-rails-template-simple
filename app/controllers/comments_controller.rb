class CommentsController < ApplicationController

  before_action :must_be_logged_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @comment.destroy
    redirect_to posts_path(@post)
  end
    
  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end