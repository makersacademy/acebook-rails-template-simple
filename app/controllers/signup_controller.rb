class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: signup_params["name"], email: signup_params["email"], password: signup_params["password"])
    if @user.valid?
      redirect_to '/homepage'
      flash.alert = "Thanks for signing up"
      @user.save
    else
      redirect_to '/signup'
      if @user.errors[:name].length != 0
        flash[:name] = "Name error: #{@user.errors[:name]}"
      end
      if @user.errors[:email].length != 0
        flash[:email] = "Email error: #{@user.errors[:email]}"
      end
      if @user.errors[:password].length != 0
        flash[:password] = "Password error: #{@user.errors[:password]}"
      end
    end
  end

  private

  def signup_params
    params.permit([:name, :email, :password])
  end
end