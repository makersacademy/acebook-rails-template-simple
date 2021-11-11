class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user_logged_in!
    if @current_user.nil?
      flash[:notice] = 'You must be logged in.'
      redirect_to root_url
    end
  end

  def prevent_logged_in_user!
    if @current_user
      flash[:notice] = 'You are already logged in.'
      redirect_to posts_url
    end
  end
end
