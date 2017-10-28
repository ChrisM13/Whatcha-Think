Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#index'
resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
  # Create a better looking URL for logging in
  get '/login', to: 'sessions#new'


end
