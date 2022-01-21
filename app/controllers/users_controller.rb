class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show 
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    p user_params
    @user = User.new(user_params)
    p @user

    if @user.save
      log_in @user
      redirect_to posts_path
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
