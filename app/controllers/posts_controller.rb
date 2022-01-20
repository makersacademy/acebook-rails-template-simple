class PostsController < ApplicationController
  
  def initialize
    @all_posts = Post.all
  end

  # def index
  #   # @display_posts =Post.all
  #   @all_posts = Post.all
  # end

  def show
    @posts = Post.find(params[:id])
    redirect_to '/posts'
    # respond_to do |format|
    #   format.html { render action: 'index'}
    # end
  end

  def create
    @post_new = Post.new(post_params)

    respond_to do |format|
      if @post_new.save
       format.html { render action: "index", notice: "Post created!"}
      else 
        p "post did not save"
        format.html {render action: 'post_error' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end