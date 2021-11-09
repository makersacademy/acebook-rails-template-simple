class UsersController < ApplicationController
  def create
    @user = User.create(params[:first_name], params[:last_name], params[:email], params[:password])
  end
end
