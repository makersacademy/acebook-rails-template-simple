class WelcomeController < ApplicationController
  def index
    # The welcome index view page renders many other pages (posts, profile etc)
    # The variables requires from those pages need to be defined here

    @posts = Post.order("created_at DESC")
    @post = Post.new
    @comment = Comment.new 
    @likes = Like

    @user = Current.user
    @users = User.all

  end

end
