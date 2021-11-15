class SessionsController < ApplicationController
  
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_url
    elsif !@user
      flash[:notice] = "An account with that email doesn't exist."
      redirect_to root_url
    else
      flash[:notice] = "That password doesn't match. Please try again."
      redirect_to root_url
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
