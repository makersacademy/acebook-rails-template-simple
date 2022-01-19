class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: signup_params[0], email: signup_params[1], password: signup_params[2])
    redirect_to '/signup/show'
  end

  # def show
  #   # redirect_to '/signup/confirmed'
  # end

  private

  def signup_params
    params.require([:name, :email, :password])
  end
end

# OPTION 1
# NO REQUIRE, ALL POSSIBLE PARAMS
# params { authenticity_key = "alkfs", token = "blah", name = "chris"
#            password = '123'}

# User.create(name: params["name"])

# OPTION 2
# USING REQUIRE, ONLY SOME PARAMS

# signup_params ["chris", "myemail.com", "123"]

# User.create(name: signup_params[0])

