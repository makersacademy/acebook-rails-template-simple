class CommentsController < ApplicationController

  before_action :must_be_logged_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      flash[:success] = "Comment posted"
      redirect_back(fallback_location: posts_path)
    else
      flash[:danger] = "Unable to post comment"
      redirect_back(fallback_location: posts_path)
    end
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
      flash[:success] = "Comment edited"
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment deleted"
      redirect_back(fallback_location: posts_path)
    else
      flash[:danger] = "Could not delete comment"
      redirect_back(fallback_location: posts_path)
    end
  end
    
  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end