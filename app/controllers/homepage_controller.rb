class HomepageController < ApplicationController

    def create
        @user = User.find_by(email: signup_params[0], password: signup_params[1])
        if @user == nil
            redirect_to "/homepage"
            flash.alert = "User not found, please try again"
        else
            redirect_to '/posts'
        end
    end
    
    private

    def signup_params
      params.require([:email, :password])
    end

end