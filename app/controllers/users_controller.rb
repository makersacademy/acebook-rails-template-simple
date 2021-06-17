class UsersController < ApplicationController
  def new 
    @user = User.new 
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :profile_picture)
  end
end
