Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show]
  devise_for :users
end
