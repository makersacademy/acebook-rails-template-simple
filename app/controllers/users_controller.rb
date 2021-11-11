class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :avatar))
    session[:user_id] = @user.id
    redirect_to posts_url
    flash[:message] = "You have signed up to Acebook!"
  end
end
