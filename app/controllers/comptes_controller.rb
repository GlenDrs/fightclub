class ComptesController < ApplicationController
  before_action :authenticate_user!
  def index
    @compte = Compte.all
  end

  def show
    @compte = Compte.find(params[:id])
  end

  private

    def params_compte
      params(:credits, :niveau, :user_id)
    end
end
