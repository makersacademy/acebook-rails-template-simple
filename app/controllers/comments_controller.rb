class CommentsController < ApplicationController
  def new
    puts "is this what you see"
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    puts "does it get here"
    @comment = @post.comments.create(comment_params)
    puts "does it get here 2"
    # WHY ARE YOU NOT REDIRECTING ANYWHERE
    # get :index, params: { :post_id => post.id }
    redirect_to post_comments_path(@post)
    # render :index
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order('created_at').reverse_order
  end

  private
  def comment_params
      params.require(:comment).permit(:user_id, :body, :post_id)
  end
end
