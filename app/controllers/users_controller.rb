class UsersController < ApplicationController


    def new
        # Provide the model instance to the form_for helper
        @user = User.new
    end

    def index
        
    end

    def create
        @user = User.new(user_params)
        if @user.save
          # add the line below to automatically login a new user
          session[:user_id] = @user.id
          flash[:notice] = "You have successfully signed up!"
          redirect_to root_path
    
        end
    end
end 