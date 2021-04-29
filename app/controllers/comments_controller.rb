class CommentsController < ApplicationController
  # New route not required if not rendering new comment form.
  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  # def index # redundant
  #   @post = Post.find(params[:post_id])
  #   @comments = @post.comments.order('created_at').reverse_order
  # end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :post_id)
  end
end
