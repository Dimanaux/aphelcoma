Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %I[index show], param: :username

  resources :problems do
    resources :comments, only: %I[create update destroy]
  end

  # Routes for Google authentication
  get "auth/:provider/callback", to: "sessions#googleAuth", as: "user_google_omniauth_authorize"

  root to: "problems#index"
end
