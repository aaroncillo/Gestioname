class ExpenseTypesController < ApplicationController
  before_action :set_expense_type, only: [:edit, :update, :destroy]

  # GET /expense_types
  def index
    @expense_types = ExpenseType.where(company_id: params[:company_id])
  end

  # GET /expense_types/new
  def new
    @company = Company.find(params[:company_id])
    @expense_types = ExpenseType.new
  end

  # GET /expense_types/1/edit
  def edit
  end

  # POST /expense_types
  def create
    @company = Company.find(params[:company_id])
    @expense_types = ExpenseType.new(expense_type_params)
    @expense_types.company = @company
    if @expense_types.save
      redirect_to new_company_expense_path, notice: "Expense type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expense_types/1
  def update
    if @expense_type.update(expense_type_params)
      redirect_to @expense_type, notice: "Expense type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /expense_types/1
  def destroy
    @expense_type.destroy
    redirect_to expense_types_url, notice: "Expense type was successfully destroyed."
  end

  private

  def set_expense_types
    @expense_type = ExpenseType.find(params[:id])
  end

  def expense_type_params
    params.require(:expense_type).permit(:expense_category)
  end
end
