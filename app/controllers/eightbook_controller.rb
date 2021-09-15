class EightbookController < ApplicationController
  
  def index
    #show homepage - user sign up
  end

  def create
    #create a new user after clicking Sign Up! button
    #create a new user obj saving params to instance variables
    #redirect to 'posts' page 
    p params[:first_name]
    p params[:last_name]
    redirect_to posts_url
  end
  
end