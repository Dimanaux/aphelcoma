Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: %I[index show], param: :username

  resources :problems do
    resources :comments, only: %I[create update destroy]
  end

  root to: "problems#index"
end
