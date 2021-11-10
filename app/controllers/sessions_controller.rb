class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # p params[:session][:email]
      # p params[:session][:password]
      # p params
      redirect_to posts_url
      p "User authenticated"
    else
      redirect_to users_url
    end
  end
end
