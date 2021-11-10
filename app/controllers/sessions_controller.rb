class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new

  end

  def create
    p "ALL PARAMS: #{params}"
    p "SESSION PARAMS: #{params[:session]}"
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_url
      p "User authenticated"
    else
      redirect_to users_url
    end
  end
end
