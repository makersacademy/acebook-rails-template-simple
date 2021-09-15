class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
    #@posts = Post.joins("INNER JOIN comments ON posts.id = comments.post_id")
  end

  def show
   @post = Post.find(params[:id])
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    @post.save
    # redirect_to @post
    redirect_to home_path
     #:action: "show", id: 1
  end
  

  private def post_params
    params.require(:post).permit(:post_content, :created_at)
  end

  


  # def new
  #   @post = Post.new
  # end

  # def show
  #   @post = Post.find(params[:id])
  # end

  # def create
  #   @post = Post.new(params[:message])
  #   @post.save
  #   redirect_to @post

  #   # @post = Post.create(post_params)
    
  # end

  # def index
  #   @posts = Post.all
  # end

  # private

  # def post_params
  #   params.require(:post).permit(:message)
  # end
end
