class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(name: params[:name])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.clear
        redirect_to "/"
    end
end
