class UsersController < ApplicationController

  def profile
    @user = Current.user
    @posts = Current.user.posts.order("created_at DESC")
    @comment = Comment.new
    @likes = Like
  end

  def everyone
    @user = Current.user
    @users = User.all
  end

  
end