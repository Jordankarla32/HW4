Rails.application.routes.draw do
  # User routes
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  
  # Session routes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'  # Adding GET route for logout
  
  # Place routes
  resources :places do
    resources :entries, only: [:new, :create]
  end
  
  # Set root path
  root 'places#index'
end