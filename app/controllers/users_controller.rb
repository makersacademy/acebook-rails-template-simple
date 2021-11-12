class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    prevent_logged_in_user!
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      picture: params[:picture],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_url
    else
      flash[:notice] = 'An account with that email already exists.'
      redirect_to root_url
    end
  end

  def index
    prevent_logged_in_user!
  end
end
