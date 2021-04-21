class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.create(comment_params)
        redirect_to posts_url(@post)
    end

    private
    def comment_params
      params.require(:comment).permit(:user, :body, :post)
    end
end
