class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  # potential to change method name to 'delete' vvv
  def delete
    session[:user_id] = nil
    redirect_to root_path, :flash => { :notice => "Logged out" }
  end
end
