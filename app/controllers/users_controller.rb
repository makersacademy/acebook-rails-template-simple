class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.create(params[:first_name], params[:last_name], params[:email], params[:picture], params[:password])
  end
end
