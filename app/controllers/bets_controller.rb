class BetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @combat_bet = Combat.all
  end

  def new
    @beting = Bet.new
  end

  def create
    @beting = Bet.new(params_bet)
    #byebug    
    if @beting.save
      redirect_to @beting, notice: "Your bett has been registred!"
    else
      flash[:erreur] = "Error no bet was taken !"
      redirect_to bets_path
    end
  end

  private

    def params_bet
      params.permit(:name_fight, :sum_bet, :user_combat_id)
    end
end
