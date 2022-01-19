class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: signup_params[0], email: signup_params[1], password: signup_params[2])
    redirect_to '/homepage'
    flash.alert = "SIGN UP COMPLETE"
    # p flash.alert
  end

  private

  def signup_params
    params.require([:name, :email, :password])
  end
end