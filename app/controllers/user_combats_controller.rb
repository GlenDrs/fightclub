class UserCombatsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 
  
  def new
    @user_combat = UserCombat.new
  end

  def create
    @user_current = User.find(current_user.id)    
    @combat_selected_id = Combat.all.each do |comb_select|
      if comb_select.combat == :name_combat
        return comb_select.id
      end
    end    
    @user_combat = UserCombat.create(user_id: @user_current, combat_id: @combat_selected_id)
  end

  def show
    @show_user_combat = UserCombat.find(params[:id])
  end

  private

  def params_join
    
    @combat = Combat.find(combat.id)
    params.permit(:user_id, :combat_id)

  end

end
