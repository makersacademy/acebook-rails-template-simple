class PostsController < ApplicationController
  
    def index
      @all_posts = Post.all
      if params[:search_by_content] && params[:search_by_content] != ""
        @all_posts = @all_posts.where("content LIKE ?", "%" + params[:search_by_content] + "%")
      end

      if params[:search_by_user] && params[:search_by_user] != ""
        user_search_id = User.find_by(name: params[:search_by_user].capitalize)
        @all_posts = @all_posts.where("users_id LIKE ?", user_search_id)
      end
  end

  def show
    @posts = Post.find(params[:id])
    redirect_to '/'
  end

  def create
    @post_new = Post.new(content: post_params["content"], users_id: session[:current_user_id])
      if @post_new.valid?
        @post_new.save
        @post_new.post_photo.attach(post_params["post_photo"])
        flash.alert = "Post created"
        redirect_to '/'
      else 
        flash.alert = "Error: Post not created"
        redirect_to '/'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    if session[:current_user_id] == @post.users_id
      @post.destroy
    else
      flash.alert = "You can only delete your own posts"
    end
    redirect_to '/posts'
  end


  private

  def post_params
    params.require(:post).permit(:content, :post_photo, :search)
  end
end