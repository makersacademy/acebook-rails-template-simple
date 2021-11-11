class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      picture: params[:picture],
      password: params[:password]
    )
    if @user.save
      flash[:notice] = 'User saved successfully'
        # strict inputs e.g. max length
      session[:user_id] = @user.id
      redirect_to posts_url

    else
      flash[:alert] = 'User was not saved.'
      render :new
    end
  end
end
