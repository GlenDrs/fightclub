class CompteController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 
  def index
    @compte = Compte.all
  end

  def show
  end
end
