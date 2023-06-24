Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :companies do
    resources :incomes, only: %i[new create]
    resources :expenses, only: %i[new create]
  end
  resources :balances, only: %i[index show]
  resources :incomes, except: %i[destroy]
  resources :expenses, except: %i[destroy]
end
