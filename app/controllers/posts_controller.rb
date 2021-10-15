class PostsController < ApplicationController
  
  def new
    @post = Post.new

  end

  def create
    #@post = Post.new(post_params)
    #@post.user_id = current_user.id
    @post = Post.create(post_params)
    @post.save 
    

    # if @post.save
    #   redirect_to posts_path, notice: "successfully created account"
    # else
    #   render :new
    # end  
    
    #redirect_to sign_up_path


  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
