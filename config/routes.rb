Rails.application.routes.draw do
  resources :months, only: [:new, :create, :show]
  resource :year, only: [:show]
  root "months#new"
end
