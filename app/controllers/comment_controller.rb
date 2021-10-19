class CommentController < ApplicationController

  include ApplicationHelper 

  def new 
    @comment = Comment.new
  end

  def create 

    @comment = Comment.new(comment_params)

    if @comment.save
      p @comment
      p @comments
      # redirect_to posts_path
      # , notice: "comment posted"
    else
      render :new
    end

  end

  def index 
    @comments = Comment.all
  end

  def comment_params
    params.require(:comment).permit(:content,:post_id)
  end

end
