class UsersController < ApplicationController
  
  def index
    #show homepage - user sign up
  end

  def create
    #create a new user after clicking Sign Up! button
    #create a new user obj saving params to instance variables
    #redirect to 'posts' page 
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password_digest: params[:password_digest])
    @user.save
    redirect_to posts_url
  end
  
end