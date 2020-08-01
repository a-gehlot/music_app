class SessionsController < ApplicationController
    skip_before_action :require_login
    
    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil? 
            flash[:now] =  ["Incorrect username or password"]
            render json: "not correct"
        else
            login_user!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end

    def new
        render :new
    end
end