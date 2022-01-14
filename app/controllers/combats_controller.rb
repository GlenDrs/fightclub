class CombatsController < ApplicationController

  def index
    @combats = Combat.all
  end

  def show
    @combat = Combat.find(params[:id])
    @bets = @combat.user_combats.joins(:bets) do |user_combat|
      user_combat
    end
    @total_sum_bet = @bets.map(&:bets)
    @x =[]
    for i in 0..@total_sum_bet.count-1
      @x[i] = @total_sum_bet[i].first.sum_bet
    end
  end

  def new
    @combat = Combat.new
  end

  def create
    @combat = Combat.new(combat_params)

    if @combat.save
      redirect_to @combat, notice: "Combat was successfully created."
    else
      redirect_to :new 
    end

  end

  def destroy
    fighter_ids = Combat.find(params[:id]).user_combats.map do |user_combat|
      user_combat.user_id
    end

    if fighter_ids.include?(current_user.id)
      @combat.destroy
      flash[:success] = "You have destroyed the combat"
      redirect_to combats_path
    else
      flash[:error] = "You can't destroy the combat of an other fighter"
      redirect_to combats_path
    end
  end

  private

    def combat_params
      params.require(:combat).permit(:name, :description)
    end
end
