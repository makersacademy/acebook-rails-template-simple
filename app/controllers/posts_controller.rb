class PostsController < ApplicationController
  

  def index
    # @display_posts =Post.all
    @all_posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
    redirect_to '/posts'
    # respond_to do |format|
    #   format.html { render action: 'index'}
    # end
  end

  def create
    @post_new = Post.new(content: post_params["content"], users_id: session[:current_user_id])
    respond_to do |format|
      if @post_new.valid?
        @post_new.save
        @post_new.post_photo.attach(post_params["post_photo"])
        p post_params["post_photo"]
        p "DID IT ATTACH?"
        p @post_new.post_photo.attached?
       format.html { render action: "index", notice: "Post created!"}
      else 
        format.html { render action: 'post_error' }
      end
    end
  end

  private

  def post_params
    p "These are the post_params"
    p params
    params.require(:post).permit(:content, :post_photo)
  end
end