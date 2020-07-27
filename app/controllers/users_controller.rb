class UsersController < ApplicationController
    before_action :correct_user, only:[:edit, :update]

    def show
        @user = User.find(params[:id])
        @articles = @user.articles.order(id: "DESC")
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           redirect_to user_path(@user)
        else
           render "edit"
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image, :address)
    end

    def correct_user
        if user_signed_in?
          user = User.find(params[:id]) 
          unless current_user == user
            redirect_to root_path
          end
        else
            redirect_to root_path
        end
    end
end
