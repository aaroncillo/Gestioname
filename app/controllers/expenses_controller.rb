class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  # GET /expense
  def index
    @expenses = Expense.all
  end
  # GET /expense/1
  def show
  end
  # GET /expense/new
  def new
    @expense = Expense.new
  end
  # GET /expense/1/edit
  def edit
  end
  # POST /expense
  def create
    @expense = Expense.new(expense)
    if @expense.save
      redirect_to @expense, notice: "expense was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /expense/1
  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: "expense was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /expense/1
  def destroy
    @expense.destroy
    redirect_to expense_url, notice: "expense was successfully destroyed.", status: :s
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:item_name,:date, :description,:amount, :company)
    end
end
