Rails.application.routes.draw do
  resources :questionnaires, only: [:index, :new]
  resources :balances, only: :index
end
