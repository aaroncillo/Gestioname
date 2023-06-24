Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :companies, shalow: true do
    # resources :incomes, only: %i[new create index]
    # resources :expenses, only: %i[new create index]
    resources :incomes
    resources :expenses
  end

  resources :balances, only: %i[index show]
  resources :incomes, except: %i[destroy index]
  resources :expenses, except: %i[destroy index]

  resources :expense_types
end
