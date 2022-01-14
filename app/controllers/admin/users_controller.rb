module Admin
  class UsersController < ApplicationController
    def index
      @list_users_for_admin = User.all
    end

    def edit
      @editing_user = User.find(params[:id])
    end
=begin
    def edit
      @user_blacklisting = User.all
      if @user_blacklisting.pudate(blacklisting_user)

      end
    end
=end
    private

    def blacklisting_users
      params.require(:user).permit(:account_active)
    end  
  end

end