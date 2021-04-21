class CommentsController < ApplicationController
  # def create
  #     # @post = Post.find(params[:post_id])
  #     @comment = Comment.create(comment_params)
  #     redirect_to post_comments
  # end

  def index
    @comments = Comment.order('created_at').reverse_order
  end

  private
  # def comment_params
  #   params.require(:comment).permit(:user, :body, :post)
  # end
end
