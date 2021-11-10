class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user_logged_in!
    redirect_to root_url, alert: 'You must be signed in' if @current_user.nil?
  end

end
