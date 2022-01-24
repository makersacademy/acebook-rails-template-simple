class CommentsController < ApplicationController
   
    def new
      @comment = Comment.new()
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)

        @comment.user_id = current_user.id 

      if @comment.save
        redirect_to posts_url
      end
    end

      
    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to posts_url
    end
    
    private
        def comment_params
          params.require(:comment).permit(:content, :post_id)
        end
end
