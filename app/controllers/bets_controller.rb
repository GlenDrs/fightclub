class BetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @combat_bet = Combat.all
  end

  def new
    @beting = Bet.new
  end

  def create
    combat_id_selected = Combat.find_by(selected_combat).id
    user_id_selected = User.find_by(selected_user).id
    @id_user_combat = UserCombat.find_by(user_id: user_id_selected, combat_id: combat_id_selected).id
    @beting = Bet.new(name_fight: params[:name_fight], sum_bet: params[:sum_bet], user_combat_id: @id_user_combat)
    if @beting.sum_bet >= current_user.compte.credits
    flash[:erreur] = "Error no bet was taken !"
    redirect_to bets_path
    elsif @beting.save
      @account_current_user = current_user.compte
      new_balance = @account_current_user.credits - @beting.sum_bet
      @account_current_user.update(credits: new_balance)
      redirect_to bet_path(@beting), notice: "Your bett has been registred!"
    else
      flash[:erreur] = "Error no bet was taken !"
      redirect_to bets_path
    end
  end

  private

    def selected_combat
      params.permit(:name)
    end

    def selected_user
      params.permit(:email)
    end
end
