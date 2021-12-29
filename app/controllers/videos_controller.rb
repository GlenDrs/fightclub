class VideosController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_user_compte = current_user.compte
    @credits = @current_user_compte.credits
    @current_user_compte.update(credits: @credits + 5 )
  end
end
