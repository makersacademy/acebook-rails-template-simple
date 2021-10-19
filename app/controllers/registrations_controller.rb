class RegistrationsController < ApplicationController

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params.except(:avatar))
    @user.avatar.attach(user_params[:avatar])
    if @user.save
      session[:first_name] = @user.first_name
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "successfully created account"
    else
      render :new
    end  
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end 


