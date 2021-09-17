class UsersController < ApplicationController
  
  def index
    
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to posts_url
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
  
end