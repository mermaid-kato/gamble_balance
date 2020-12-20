Rails.application.routes.draw do
  resources :balances, only: [:index]
end
