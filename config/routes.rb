Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: %I[index show], param: :username

  scope shallow_path: "problems" do
    resources :problems do
      resources :comments, shallow: true, only: %I[create edit update destroy]
      resources :solutions, shallow: true, only: %I[index show new create destroy]
    end
  end

  root to: "problems#index"
end
