module Admin
  class BetsController < ApplicationController
    def index
      @bet = Bet.all
    end

    def new
    end

    def create
    end

  end

end
