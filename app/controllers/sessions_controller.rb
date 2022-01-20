class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to posts_path
    else
      flash.now[:danger] = 'Invalid email/password combination' # GET http://localhost:3000/public/style.css net::ERR_ABORTED 404 (Not Found)
      render 'new'
    end
  end

  def destroy

  end
end
