class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: signup_params["name"], email: signup_params["email"], password: signup_params["password"])
    p "user was created"
  end

  # def index
  #   @posts = Post.all
  # end

  private

  def signup_params
    params
  end
end
