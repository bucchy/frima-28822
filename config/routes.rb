Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  get 'items/:id', to: 'items#checked'
   resources :donations, only: [:index, :new, :create]

  #resources :users, only: :show

end

