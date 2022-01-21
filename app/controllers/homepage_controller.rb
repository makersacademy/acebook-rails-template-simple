class HomepageController < ApplicationController

    def create
        @user = User.find_by(email: signup_params["email"], password: signup_params["password"])
        if @user == nil
            redirect_to "/homepage"
            if User.find_by(email: signup_params[0]) == nil
                flash.alert = "User not found, please try again"
            else
                flash.alert = "Incorrect Password, please try again"
            end
        else
            session[:current_user_id] = @user.id
            redirect_to '/posts'
        end
    end
    
    private

    def signup_params
      params.permit([:email, :password])
    end

end