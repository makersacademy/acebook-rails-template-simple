class CommentsController < ApplicationController
  skip_before_action :require_logout

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment =
      @post_image.comments.create(
        comment_params.merge(user_id: session[:user_id]),
      )
    redirect_to post_image_path(@post_image)
  end

  def update
    if @post_image.update(post_image_params)
      redirect_to @post_image, notice: 'Post was successfully updated.'
    else
      redirect_to edit_post_image_url,
                  alert: 'Post was not successfully updated.'
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    @comment = @post_image.comments.find(params[:id])
    @comment.destroy
    redirect_to post_image_path(@post_image),
                alert: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
