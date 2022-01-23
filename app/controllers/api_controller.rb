class ApiController < ActionController::API
  before_action :set_current_user

  helper_method :set_current_user
  helper_method :logged_in?

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !set_current_user.nil?
  end

end
