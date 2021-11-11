class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user_logged_in!
    # show some sort of error popup with a button to redirect to homepage
    if @current_user.nil?
      flash[:login] = 'You must be signed in'
      redirect_to root_url
    end
  end

end
