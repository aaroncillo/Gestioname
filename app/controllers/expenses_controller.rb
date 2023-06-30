class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  # GET /expense
  def index
    @company = Company.find(params[:company_id])
    @expenses = Expense.where(company_id: params[:company_id])
    @expenses = @company.expenses
  end
  # GET /expense/1
  def show
  end
  # GET /expense/new
  def new
    @company = Company.find(params[:company_id])
    @company_categories = ExpenseType.where(company_id: @company.id).map{|services| services.expense_category}
    @expense = Expense.new
  end
  # GET /expense/1/edit
  def edit
    @company = Company.find(params[:company_id])
    @expense.company_id = @company.id
  end
  # POST /expense
  # def create
  #   @expense = Expense.new(expense_params)
  #   @company = Company.find(params[:company_id])
  #   @expense.company_id = @company.id
  #   if @expense.save
  #     redirect_to company_expenses_path, notice: "expense was successfully created."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end


  #CHAT GPT
  def create
    @expense = Expense.new(expense_params)
    @company = Company.find(params[:company_id])
    @expense.company_id = @company.id
    if @expense.save
      redirect_to company_expenses_path, notice: "expense was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expense/1
  def update
    if @expense.update(expense_params)
      redirect_to company_expenses_path, notice: "expense was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /expense/1
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to company_expenses_path(@expense.company_id), notice: "expense was successfully destroyed.", status: :see_other
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:item_name, :date, :description, :amount, :expense_type_id)
    end
end
