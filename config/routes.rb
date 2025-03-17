Rails.application.routes.draw do
  root "places#index"
  
  resources :places, only: [:index, :show, :new, :create]
  resources :entries, only: [:new, :create]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
