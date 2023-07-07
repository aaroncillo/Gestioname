class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  before_action :set_company_user, only: %i[ show index edit new]
  # GET /restaurants
  def index
  end
  # GET /restaurants/1
  def import
    file = params[:file] # Obtiene el archivo Excel enviado desde el formulario

    if file.present? && file.respond_to?(:path)
      data = Roo::Spreadsheet.open(file.path) # Abre el archivo Excel utilizando la gema "roo"

      # Procesa los datos del archivo Excel según tus necesidades
      # Por ejemplo, puedes iterar sobre las filas y guardar los datos en la base de datos
      data.each_row_streaming do |row|
        # Lógica de procesamiento de datos
      end

      flash[:notice] = 'El archivo Excel se ha importado correctamente.'
    else
      flash[:alert] = 'Debe seleccionar un archivo Excel para importar.'
    end

    redirect_to company_path(@company)
  end

  def show
    incomes = Income.joins(:company).where(company_id: params[:id])
    expenses = Expense.joins(:company).where(company_id: params[:id])
    @registers = incomes + expenses

    @total_amount = 0
    @incomes_amount = 0
    @expense_amount = 0

    incomes.each do |income|
      @incomes_amount += income.amount
    end

    expenses.each do |expense|
      @expense_amount += expense.amount
    end

    @total_amount = @incomes_amount - @expense_amount
    unless @incomes_amount.zero?
      @porcentaje_incomes = ((@incomes_amount / (@incomes_amount + @expense_amount)) * 100).round(2)
      @porcentaje_expense = ((@expense_amount / (@incomes_amount + @expense_amount)) * 100).round(2)
    end
  end
  # GET /restaurants/new
  def new
    @company = Company.new
  end
  # GET /restaurants/1/edit
  def edit

  end
  # POST /restaurants
  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to @company, notice: "company was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /companys/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: "company was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /companys/1
  def destroy
    @company.destroy
    redirect_to companies_path, notice: "company was successfully destroyed.", status: :see_other
  end

  def chart
    @chart_type = params[:chart_type]
    @expenses = Expense.joins(:company).where(company_id: params[:id]).group(:item_name).sum("amount")
    render partial: "chart", locals: { chart_type: @chart_type, expenses: @expenses }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name_company, :description, :user_id)
    end

    def set_company_user
      @companies = Company.where(user_id: current_user.id)
    end
end
