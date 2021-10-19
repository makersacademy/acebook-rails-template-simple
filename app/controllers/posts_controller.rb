class PostsController < ApplicationController
  
  # def posts
  #   @post = Post.order(created_at: :desc)
  # end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.except(:image))
    @post.image.attach(post_params[:image])

    if @post.save
      redirect_to posts_path, notice: "successfully created account"
    else
      render :new
    end  
    
    #redirect_to sign_up_path


  end

  def index
    @posts = Post.newest_first
  end

  private

  def post_params
    params.require(:post).permit(:message,:user_id, :image)
  end
end
