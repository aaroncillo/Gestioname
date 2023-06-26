class ExpensesTypesController < ApplicationController
  before_action :set_expense_type, only: %i[ edit update destroy ]
  # GET /expense
  def index
    @expenses_types = ExpenseType.where(company_id: params[:company_id])
  end

  # GET /expense_type_new
  def new
    @expense_type= ExpenseType.new
  end
  # GET /expense_type1/edit
  def edit
  end
  # POST /expense_type
    def create
    @expense_type= ExpenseType.new(expense_type)
    if @expense_type.save
      redirect_to @expense, notice: "expense_type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /expense_type1
  def update
    if @expense_type.update(expense_type params)
      redirect_to @expense_type, notice: "expense_type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /expense_type1
  def destroy
    @expense_type.destroy
    redirect_to expense_typeurl, notice: "expense_type was successfully destroyed.", status: :s
  end

  private

    def set_expense_type
      @expense_type= expense_type find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def expense_type params
      params.require (:expense_type).permit(:expense_category)
    end
  end





















end
