class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :email, :password_confirmation, :image, :first_name, :last_name, :date_of_birth))

    session[:user_id] = @user.id
    if @user.save
  session[:user_id] = @user.id
  redirect_to root_path, notice: "Account created!"
else
  render :new
end
  end
end