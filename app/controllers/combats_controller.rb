class CombatsController < ApplicationController

  def index
    @combats = Combat.all
  end

  def show
    @combats = Combat.find(params[:id])
  end

  def new
    @combat = Combat.new
  end

  def create
    @combat = Combat.new(combat_params)

    respond_to do |format|
      if @combat.save
        format.html { redirect_to @combat, notice: "Combat was successfully created." }
        format.json { render :show, status: :created, location: @combat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
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
      params.permit(:combat, :description)
    end

end
