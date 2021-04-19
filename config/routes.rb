Rails.application.routes.draw do
  root to: "furimas#index"
  resources :furimas
  devise_for :users
end
