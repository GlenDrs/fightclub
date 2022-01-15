module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin
    def index
      @list_users_for_admin = User.all
    end

    def edit 
      @editing_user = User.find(params[:id])
    end

    def update
      @editing_user = User.find(params[:id])
      if @editing_user.update(blacklisting_user)
        flash[:success] = "Your operation of blacklisting or unblocking
        the user was executed!"
        redirect_to admin_users_path
      else
        flash[:error] = "You operation for blacklisting
        or unblocking the user didn't work"
        render 'edit'
      end
    end

    private

    def blacklisting_user
      params.require(:user).permit(:account_active)
      #params[:user][:account_active]
    end

    def authenticate_admin
      unless current_user&.admin
        flash[:error] = "You're not a adminstrator"
        redirect_to root_path
      end
    end

  end
end
