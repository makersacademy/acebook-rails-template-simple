class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_url
      flash[:message] = "You have logged in successfully!"
    else
      redirect_to login_url
      flash[:message] = "Incorrect details - try again"
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to welcome_url
    flash[:message] = "You have logged out successfully!"
  end
end
