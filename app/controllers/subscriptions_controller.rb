class SubscriptionsController < ApplicationController
  before_action :set_company_user, only: %i[show index edit new]
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_company_user
    @companies = Company.where(user_id: current_user.id)
  end
end
