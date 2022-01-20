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
      flash.alert = ["Issue with Name #{@user.errors[:name]}"]
      flash.alert << "Issue with Email #{@user.errors[:email]}"
    end
  end

  private

  def signup_params
    params.permit([:name, :email, :password])
  end
end