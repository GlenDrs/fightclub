class CombatsController < ApplicationController

  def index
    @combats = Combat.all
  end

  def show
    @combat = Combat.find(params[:id])
    @bets = @combat.user_combats.map do |user_combat|
      user_combat.bets
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
