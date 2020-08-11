Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts
  #post 'posts', to: 'posts#create'
  #get 'posts/id', to: 'posts#checked'
end