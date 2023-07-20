class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def subscriptions
    @companies = Company.where(user_id: current_user.id)
  end
end
