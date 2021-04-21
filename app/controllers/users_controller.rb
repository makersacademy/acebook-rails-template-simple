class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def delete
  end
end
