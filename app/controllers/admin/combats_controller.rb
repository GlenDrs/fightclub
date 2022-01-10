module Admin
  class CombatsController < ApplicationController
    before_action :authenticate_admin
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

    def destroy
      @combat.destroy
    end

    private

    def combat_params
      params.require(:combat).permit(:name, :description)
    end

    def authenticate_admin
      unless current_user&.admin
        flash[:error] = "You're not a adminstrator"
        redirect_to root_path
      end
    end

  end
end  
