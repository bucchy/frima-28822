Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items

   resources :donations, only: [:index, :new, :create]

  #resources :users, only: :show

end

