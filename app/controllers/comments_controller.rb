class CommentsController < ApplicationController

def create
    @comments = Comment.new(user_id: session[:current_user_id], post_id: comment_params["post_id"], content: comment_params["content"])
    @comments.save
    redirect_to '/posts'
  end

  def show 
    @posts_all = Post.all
  end

  def comment_params
    params.permit([:user_id, :post_id, :content])
  end
end

