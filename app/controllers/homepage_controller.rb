class HomepageController < ApplicationController

    def create
        @user = User.find_by(email: signup_params[0], password: signup_params[1])
        if @user == nil
            redirect_to "/homepage"
            flash.alert = "User not found, please try again."
        else
            session[:current_user_id] = @user.id
            p "Who is stored in the session"
            p session[:current_user_id]
            redirect_to '/posts'
        end
    end

    def destroy
        session[:current_user_id] = nil
            p session[:current_user_id]
            redirect_to '/homepage'
    end
    
    private

    def signup_params
      params.require([:email, :password])
    end

end