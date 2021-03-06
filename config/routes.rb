Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#index'
resources :users, only: [:new, :create, :edit, :update]
resources :surveys do
  resources :questions, only: [:create, :show, :destroy], shallow: true do 
    resources :answers, only: [:create]
  end 
end


  resources :sessions, only: [:new, :create, :destroy]
  # Create a better looking URL for logging in
  get '/login', to: 'sessions#new'


end
