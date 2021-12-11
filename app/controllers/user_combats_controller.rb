class UserCombatsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 
  
  def new
    @user_combat = UserCombat.new
  end

  def create
    @user_current = User.find(current_user.id) 
    @combat_for_id = Combat.all
    var_name =  params[:combat]
    combat_selected = Combat.find_by(combat: var_name)
    combat_selected_id =  combat_selected.id
    
    @user_combat = UserCombat.new(user_id: @user_current, combat_id: combat_selected_id)
  end

  def show
    @show_user_combat = UserCombat.find(params[:id])
  end

  private

  def params_join
       
  end

end
