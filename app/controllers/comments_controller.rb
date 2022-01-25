class CommentsController < ApplicationController

  before_action :must_be_logged_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    @commenter = User.find(current_user.id)
    flash.now[:success] = "Comment posted"
    # TODO: How to add a flash message when comment is dynamically added with js?

    do_not_run_js_in_test

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

    @comment.destroy

    do_not_run_js_in_test
    
    # if @comment.destroy
    #   flash[:success] = "Comment deleted"
    #   redirect_back(fallback_location: posts_path)
    # else
    #   flash[:danger] = "Could not delete comment"
    #   redirect_back(fallback_location: posts_path)
    # end
  end
    
  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end