Rails.application.routes.draw do
  resources :problems
  devise_for :users
  resources :users, only: %I[index show]
  root to: "problems#index"
end
