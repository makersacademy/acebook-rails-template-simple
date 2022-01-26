class CommentsController < ApplicationController

  before_action :must_be_logged_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_back(fallback_location: posts_path)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def show

  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path(@post)
  end
    
  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end