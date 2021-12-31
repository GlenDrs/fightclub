class BetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @beting = Bet.new
  end

  def index
    @combat_bet = Combat.all
  end

  def create
    @beting = Bet.new(params_bet)
    #byebug    
    if @beting.save
      redirect_to @beting, notice: "Your bett has been registred!"
    else
      redirect_to :combats_path
    end
  end

  private

    def params_bet
      params.permit(:name_fighter_bet,:sum_bet, :checking_bet)
    end
end
