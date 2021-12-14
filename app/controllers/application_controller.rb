class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :set_current_user
  before_action :require_login

  def set_current_user
      if session[:user_id]
        Current.user = User.find(session[:user_id])
    end
  end 

  def require_login
    if session[:user_id] == nil
      redirect_to root_path, alert: "Must login to access content"
    end 
  end 
    
end
