Rails.application.routes.draw do
  get 'subscriptions/index'
  get 'subscriptions/show'
  get 'subscriptions/new'
  get 'subscriptions/create'
  get 'subscriptions/edit'
  get 'subscriptions/update'
  get 'incomes/index'
  get 'incomes/show'
  get 'incomes/new'
  get 'incomes/create'
  get 'incomes/edit'
  get 'incomes/update'
  devise_for :users
  root to: "pages#home"

  resources :companies do
    resources :incomes, only: %i[new create]
    resources :expenses, only: %i[new create]
  end

  resources :balances, only: %i[index show]
  resources :incomes, except: %i[destroy]
  resources :expenses, except: %i[destroy]

  resources :expense_types
end
