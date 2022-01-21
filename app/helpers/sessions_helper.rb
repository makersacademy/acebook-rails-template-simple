module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def must_be_logged_in
    if !logged_in?
      flash[:danger] = "Must be logged in to do that"
      redirect_to root_path
    end
  end

  def cannot_go_home
    if logged_in?
      redirect_to posts_path
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
