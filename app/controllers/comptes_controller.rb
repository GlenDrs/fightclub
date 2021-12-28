class ComptesController < ApplicationController
  before_action :authenticate_user!
  def index
    @compte = Compte.all
  end

  def show
    @compte = Compte.find(params[:id])
  end

  def update
    if @user_count = User.where("last_seen_at < ?", comptes_path.include?(current_user),2.minutes.ago).count
      #if comptes_path.include?(current_user)
      @compte.credits = 5 * @user_count
    end
  end

  private

    def params_compte
      params(:credits, :niveau, :user_id)
    end
end
