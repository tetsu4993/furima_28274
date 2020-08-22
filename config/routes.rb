Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  get 'items/:id', to: 'items#show'
end