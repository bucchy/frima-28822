Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # get 'articles/index'
  # get 'articles/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :articles
end
