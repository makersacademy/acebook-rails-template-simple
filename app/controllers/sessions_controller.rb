class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? #&& user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      session[:first_name] = user.first_name
      redirect_to posts_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged Out'
  end
end
