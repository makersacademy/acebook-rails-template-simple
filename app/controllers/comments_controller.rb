class CommentsController < ApplicationController

    def create
        @comment = Comment.new(post_params)
        @comment.save
        redirect_to posts_path
    end

    private def post_params
        params.require(:comment).permit(:comment, :post_id)
    end

end
