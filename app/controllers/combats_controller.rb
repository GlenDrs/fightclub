class CombatsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 

  def index
    @combats = Combat.all
  end

  def show
    @combat = Combat.find(params[:id])
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

  def edit
  end

  def update
  end

  def destroy 
    @combat.destroy
  end

  private
   
    def combat_params
     # params.require(:combat).permit(:combat, :description)
      params.permit(:name, :description)
    end

end
