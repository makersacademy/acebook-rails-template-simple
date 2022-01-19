class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
    respond_to do |format|
      format.html { render action: 'index'}
    end
  end

  def create
    @post_new = Post.new(post_params)

    respond_to do |format|
      if @post_new.save
        p 'post was saved'
       @posts.push(@post_new)
       format.html { render action: "index", notice: "Post created!"}
      else 
        p "not happening"
        format.html {render action: 'new' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end