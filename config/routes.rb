Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :companies, shalow: true do
    # resources :incomes, only: %i[new create index]
    # resources :expenses, only: %i[new create index]
    resources :incomes
    resources :expenses
    resources :expense_types
  end

  resources :balances, only: %i[index show]
  resources :incomes, except: %i[index new create]
  resources :expenses, except: %i[index new create]

  resources :expense_types, except: %i[destroy index]
end
