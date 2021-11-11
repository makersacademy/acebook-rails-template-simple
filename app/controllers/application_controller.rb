class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_theme
  before_action :authorized
  helper_method :authorized
  helper_method :current_user
  helper_method :logged_in?

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      # session[:theme] = theme
      cookies[:theme] = theme
      redirect_to(request.referrer || root_path)
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def profile_username
    User.where(id: params[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

end
