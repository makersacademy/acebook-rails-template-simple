class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: session_params[:username])
    
    if @user == nil
      render json: {
        logged_in: false, 
        message: 'That username does not exist',
        status: 403
      }
    elsif @user.authenticate(session_params[:password]) == false
      render json: {
        logged_in: false, 
        message: 'Password is incorrect',
        status: 403
      }
    else
      login!
      render json: {
        logged_in: true,
        user: @user
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        status: 401
      }
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
