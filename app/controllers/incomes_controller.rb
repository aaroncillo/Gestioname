class IncomesController < ApplicationController
  before_action :set_income, only: %i[ show edit update destroy ]
  before_action :set_company_user, only: %i[ show index edit new]
  before_action :set_company, only: %i[ index edit new create]
    # GET /incomes
  def index
    @incomes = Income.where(company_id: params[:company_id])
    @incomes = @company.incomes.order(date: :desc)
  end
    # GET /incomes/1
  def show
  end
    # GET /incomes/new
  def new
    #/companies/1/incomes/new
    @income = Income.new
  end
    # GET /incomes/1/edit
  def edit
    @income = Income.find(params[:id])
  end
    # POST /incomes
  def create
    @income = Income.new(income_params)
    @income.company_id = @company.id
    if @income.save
      redirect_to @company, notice: "income was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /incomes/1

  def update
    if @income.update(income_params)
      redirect_to @income.company_id, notice: "income was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /incomes/1

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to company_path, notice: "income was successfully destroyed.", status: :see_other
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

  def set_company_user
    @companies = Company.where(user_id: current_user.id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
