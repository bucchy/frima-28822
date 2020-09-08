Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  devise_for :users
  get 'posts', to: 'posts#index'#
  get 'posts/new', to: 'posts#new'#
  post 'posts', to: 'posts#create'#
    
  get 'articles/index'
  get 'articles/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles
end
