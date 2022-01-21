class CommentsController < ApplicationController

  before_action :must_be_logged_in

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to posts_path

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