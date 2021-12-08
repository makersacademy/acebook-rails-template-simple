class RegistrationsController < ApplicationController
  
    def new
      @user = User.new
    end

    def create
      @user = User.create(post_params)

      if @user.save
        redirect_to root_url, notice: "Account created successfully!"
      else
        render :new
      end
    end
  
    private
  
    def post_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  

  end