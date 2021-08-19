class UsersController < ApplicationController
    def index
      if !helpers.logged_in?
        redirect_to "/"
      end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          redirect_to 'new'
        end
    end
    
    def show
      if !helpers.logged_in?
        redirect_to "/"
      end
        @user = helpers.current_user
    end

    private
  
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
