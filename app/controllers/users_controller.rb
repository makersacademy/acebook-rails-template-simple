class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    prevent_logged_in_user!
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_url
    else
      render :new
    end
  end

  def index
    prevent_logged_in_user!
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
