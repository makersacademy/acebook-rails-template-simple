class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def search
   @users = User.where("username LIKE ?", "%" + params[:q] + "%")
  end
end
