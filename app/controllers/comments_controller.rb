class CommentsController < ApplicationController
  def create 
    @comment = Current.user.comments.new(post_params)
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to posts_url
    else
      flash[:notice] = 'There was a problem.'
    end
  end

  private 

  def post_params
    params.require(:comment).permit(:message)
  end
end
