class ExpensesTypesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  # GET /expense
  def index
    @expenses_types = Expense_Type.where(expense_type_id: params[:expense_type_id])
  end
  # GET /expense_type1
  def show
  end
  # GET /expense_type_new
  def new
    @expense_type= expense_typenew
  end
  # GET /expense_type1/edit
  def edit
  end
  # POST /expense_type  def create
    @expense_type= expense_typenew(expense_type)
    if @expense_typesave
      redirect_to @expense_type notice: "expense_type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /expense_type1
  def update
    if @expense_type update(expense_type params)
      redirect_to @expense_type notice: "expense_type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /expense_type1
  def destroy
    @expense_type destroy
    redirect_to expense_typeurl, notice: "expense_typewas successfully destroyed.", status: :s
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_type
      @expense_type= expense_type find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def expense_type params
      params.require (:expense_type.permit(:item_name,:date, :description,:amount, :company)
    end
  end




















end
