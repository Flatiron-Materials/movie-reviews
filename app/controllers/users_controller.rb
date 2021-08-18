class UsersController < ApplicationController
    def index
    end

    def def new
        @user = User.new
    end

    def def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def show
    end

    private

    def user_params
    end
end
