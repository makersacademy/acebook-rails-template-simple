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
      redirect_to '/posts'  # TODO <- redirect is shown in server log but the page does not change in browser
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
