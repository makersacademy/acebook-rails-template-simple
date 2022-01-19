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
    p params
    @user = User.new(user_params)

    if @user.save
      p "hello"
      redirect_to posts_path
      p "I am run"
    else
      p "this else is being run"
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
