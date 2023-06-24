class BalancesController < ApplicationController
  def index
    @balances = Balance.all
  end
  # GET /restaurants/1

  def show
    @balances = Balance.find(params[:id])
  end
end
