class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :set_company_user, only: %i[show index edit new]

  # GET /companies
  def index
  end

  # GET /companies/1
  def show
    @income = Income.new
    @expense = Expense.new
    @expense_types = ExpenseType.new
    @incomes = Income.joins(:company).where(company_id: params[:id])
    @expenses = Expense.joins(:company).where(company_id: params[:id])
    @registers = @incomes + @expenses
    @total_amount = 0
    @incomes_amount = 0
    @expense_amount = 0
    @incomes.each do |income|
      @incomes_amount += income.amount
    end

    @expenses.each do |expense|
      @expense_amount += expense.amount
    end

    @total_amount = @incomes_amount - @expense_amount

    unless @incomes_amount.zero?
      @porcentaje_incomes = ((@incomes_amount / (@incomes_amount + @expense_amount)) * 100).round(2)
      @porcentaje_expense = ((@expense_amount / (@incomes_amount + @expense_amount)) * 100).round(2)
    end
  end

  # GET /companies/new
  def new
    if current_user.subscription.subscription_type == 'basic' && @companies.count < 2
      redirect_to companies_path, alert: 'You have reached the maximum number of companies allowed'
    else
      @company = Company.new
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    @company.user = current_user

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_path, notice: 'Company was successfully destroyed.', status: :see_other
  end

  def chart
    @chart_type = params[:chart_type]
    @expenses = Expense.joins(:company).where(company_id: params[:id]).group(:item_name).sum('amount')
    render partial: 'chart', locals: { chart_type: @chart_type, expenses: @expenses }
  end

  def import
    file = params[:file]
    company_id = params[:company_id]

    return redirect_to companies_path, alert: 'No such file detected' unless file
    return redirect_to companies_path, alert: 'Please select a CSV file instead' unless file.content_type == 'text/csv'

    csv_import_service = CsvImportService.new(file, company_id, current_user)
    csv_import_service.import

    redirect_to company_path(company_id), notice: "#{csv_import_service.number_imported_with_last_run} incomes imported"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name_company, :description, :user_id, :logo)
  end

  def set_company_user
    @companies = Company.where(user_id: current_user.id)
  end
end
