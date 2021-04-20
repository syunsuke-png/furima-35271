Rails.application.routes.draw do
  root to: "items#index"
  #resources :furimas
  resources :items
  devise_for :users
end
