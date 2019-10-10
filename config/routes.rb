Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: "user"
  resources :problems
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "problems#index"
end
