class BalancesController < ApplicationController
  def index
    @balances = Balance.all
  end

  def show
    @balances = Balance.find(params[:id])
  end
end
