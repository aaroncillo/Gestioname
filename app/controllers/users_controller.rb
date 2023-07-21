class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def subscriptions
  end
end
