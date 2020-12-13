Rails.application.routes.draw do
  resources :questionnaires, only: :index
  resources :balances, only: :index
end
