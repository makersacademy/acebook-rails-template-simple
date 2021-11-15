class UsersController < ApplicationController

  def profile
    @user = Current.user
  end

  def everyone
    @user = Current.user
  end

  
end