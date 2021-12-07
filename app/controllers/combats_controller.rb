class CombatsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 

  def index
    @combats = Combat.all
  end

  def show
  end

  def new
    @combat = Combat.new
  end

  def create
    @combat = Combat.new (combat_params)
  end

  def destroy 
    @combat.destroy
  end

  private

    def combat_params
      params.require(:combat).permit(:combat, :description) 
    end
end
