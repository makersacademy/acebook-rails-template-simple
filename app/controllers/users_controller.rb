class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      picture: params[:picture],
      password: params[:password]
    )
    # strict inputs e.g. max length
    redirect_to posts_url
  end

  # 1234@example.com
  # abc
end
