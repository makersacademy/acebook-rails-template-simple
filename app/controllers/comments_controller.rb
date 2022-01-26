class CommentsController < ApplicationController

def create
    @comments = Comment.new(user_id: session[:current_user_id], post_id: comment_params["post_id"], content: comment_params["content"])
    @comments.save
    redirect_to '/posts'
  end

  def show 
    @posts_all = Post.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    if session[:current_user_id] == @comment.user_id
      @comment.destroy
    else
      flash.alert = "You can only delete your own comments"
    end
    redirect_to '/posts'
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    update_params = comment_params["comment"]
    if session[:current_user_id] != @comment.user_id
      flash.alert = "Error: You can only Edit your own Comments"
    elsif @comment.update(user_id: session[:current_user_id], post_id: update_params["post_id"], content: update_params["content"])
      flash.alert = "Comment Updated"
    else
      flash.alert = "Error: Comment not updated"
    end
    redirect_to '/'
  end

  private

  def comment_params
    params.permit(:user_id, :post_id, :content, comment: [:content, :post_id])
  end
end

