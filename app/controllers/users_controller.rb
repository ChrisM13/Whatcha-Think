class UsersController < ApplicationController


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          flash[:notice] = "You have successfully signed up!"
          if @user.admin
          redirect_to root_path
          else
            redirect_to survey_path
          end
    
        end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to root_path
      else
        render :edit
      end
    end

    private

        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
end 