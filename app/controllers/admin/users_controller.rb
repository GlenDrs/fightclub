module Admin
  class UsersController < ApplicationController
    def index
      @list_users_for_admin = User.all
    end

    def edit 
      @editing_user = User.find(params[:id])
    end

    def update
      @editing_user = User.find(params[:id])
      if @editing_user.update(blacklisting_user)
        flash[:success] = "You have blacklisted the user"
        redirect_to admin_user_path
      else
        flash[:error] = "You didn't blacklisted the user"
        render 'edit'
      end
    end

    private

    def blacklisting_user
      params.require(:user).permit(:account_active)
      #params[:user][:account_active]
    end  
  end
end
