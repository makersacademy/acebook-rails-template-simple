class UsersController < ApplicationController

  def show; end

  def index
    @user = Current.user
    @users = User.all
  end

  
end