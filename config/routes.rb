Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %I[index show]
  resources :problems do
    resources :comments, only: %I[create update destroy]
  end
  root to: "problems#index"
end
