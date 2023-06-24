class IncomesController < ApplicationController
  before_action :set_income, only: %i[ show edit update destroy ]
  # GET /restaurants
  def index
    @incomes = Income.all
  end
  # GET /restaurants/1
  def show
  end
  # GET /restaurants/new
  def new
    @income = Income.new
  end
  # GET /restaurants/1/edit
  def edit
  end
  # POST /restaurants
  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to @income, notice: "income was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /incomes/1
  def update
    if @income.update(income_params)
      redirect_to @income, notice: "income was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /incomes/1
  def destroy
    @income.destroy
    redirect_to incomes_url, notice: "income was successfully destroyed.", status: :see_other
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def income_params
      params.require(:income).permit(:item_name,:date, :description,:amount, :company_id)
    end
end
