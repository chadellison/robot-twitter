Rails.application.routes.draw do
  root "posts#index"

  resources :robots, only: [:show]

  get "followers/:id", to: "followers#index", as: :followers
  get "following/:id", to: "following#index", as: :following
end
