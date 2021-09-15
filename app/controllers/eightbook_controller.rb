class EightbookController < ApplicationController
  
  def index
    #show homepage - user sign up
  end

  def create
    #create a new user after clicking Sign Up! button
    #create a new user obj saving params to instance variables
    #redirect to 'posts' page 
    @user = User.new(post_params)
    @user.save
    redirect_to posts_url
  
  end
  

  private 
    def post_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end