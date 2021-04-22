class UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @users = User.create!(user_params)
    json_response(@users, :created)
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def delete
  end
  
  private

  def user_params
    params.permit(:forename, :surname, :username, :email, :password, :profilePic)
  end
end


