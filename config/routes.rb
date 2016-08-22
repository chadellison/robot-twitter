Rails.application.routes.draw do
  root "posts#index"

  resources :robots, only: [:show]
end
