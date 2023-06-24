class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  # GET /restaurants
  def index
    @companies = Company.where(user_id: current_user.id)
  end
  # GET /restaurants/1
  def show
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
    redirect_to companys_url, notice: "company was successfully destroyed.", status: :see_other
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
end
