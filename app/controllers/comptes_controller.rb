class ComptesController < ApplicationController
  before_action :authenticate_user!
  def index
    @compte = Compte.all
  end

  def show
    @compte = Compte.find(params[:id])
    @compte_update = params_updatin_credits
  end

  private

    def params_updatin_credits
      current_user.compte.credits - @beting.sum_bet
    end

    def params_compte
      params(:credits, :niveau, :user_id)
    end
end
