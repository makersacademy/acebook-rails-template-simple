class CommentsController < ApplicationController
   
    def new
      @comment = Comment.new
    end
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to posts_url
      end
    
      private
        def comment_params
          params.require(:comment).permit(:content)
        end
end
