class CommentsController < ApplicationController
def create
    @comment = Comment.new(post_params)
    @comment.save
    # redirect_to @post
    redirect_to posts_path
        #:action: "show", id: 1
end
private def post_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
end
end
