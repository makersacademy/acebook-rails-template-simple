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

  def edit
    @current_user = Current.user
  end

  def update 
    if @current_user.update(params.require(:user).permit(:username, :password, :email, :password_confirmation, :image, :first_name, :last_name, :date_of_birth))
      redirect_to root_path, notice: "Account updated!"
    else
      render :edit
      flash[:notice] = "There was a problem updating your details. Try again."
    end
  end
end