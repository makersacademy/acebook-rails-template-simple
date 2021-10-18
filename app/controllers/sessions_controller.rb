class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
      session[:user_id] = user.id
      session[:first_name] = user.first_name
      redirect_to posts_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = ' You have used an invalid email or password, Let\'s try that again!'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
  
end