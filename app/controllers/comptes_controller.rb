class ComptesController < ApplicationController
  before_action :authenticate_user!
  def index
    @compte = Compte.all
  end

  def show
    @compte = Compte.find(params[:id])
    @current_user = @current_user.compte.credits - @beting.sum_bet
  end

  private

    def params_compte
      params(:credits, :niveau, :user_id)
    end
end
