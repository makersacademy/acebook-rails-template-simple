class CommentsController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = @post_image.comments.create(comment_params)
    redirect_to post_image_path(@post_image)
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    @comment = @post_image.comments.find(params[:id])
    @comment.destroy
    redirect_to post_image_path(@post_image)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
