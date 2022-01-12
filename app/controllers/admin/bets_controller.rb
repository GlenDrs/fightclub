module Admin
  class BetsController < ApplicationController
    before_action :authenticate_admin
    def index
      @bet = Bet.all
    end

    def show
      @show_bet = Bet.find(params[:id])
      @user_made_bet = User.find( @show_bet.user_id)
    end

    def destroy
      Bet.destroy
    end

    private

    def authenticate_admin
      unless current_user&.admin
        flash[:error] = "You're not a adminstrator"
        redirect_to root_path
      end
    end
  end
end
