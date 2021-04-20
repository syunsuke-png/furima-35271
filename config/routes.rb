Rails.application.routes.draw do
  root to: "items#index"
  #resources :furimas
  resources :items, only: [:index, :new, :create]
  devise_for :users
end
