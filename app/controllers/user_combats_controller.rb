class UserCombatsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 
  def index
  end

  def new
    @user_combat = UserCombat.new
    @combat_for_id = Combat.all
  end

  def create
    user_current_id = current_user.id 
    combat_name = params["user_combat"]["combat_name"]
    combat_search = Combat.find_by(name: combat_name)
    user_combat = UserCombat.new(user_id: user_current_id, combat_id: combat_search.id)
    if user_combat.save
      flash[:succes] = "You have created a participation!"
      redirect_to user_combat_path(user_combat.id)
    else
      flash.now[:error] = user_combat.errors.messages
      render action: :new
    end
  end

  def show
    @show_user_combat = UserCombat.find(params[:id])
  end

  private

  def params_join
    params(:name)
  end

end
