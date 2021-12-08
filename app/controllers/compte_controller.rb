class CompteController < ApplicationController
  def index
    @compte = Compte.all
  end

  def show
  end
end
