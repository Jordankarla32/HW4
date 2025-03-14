Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete "/logout", to: "sessions#destroy", as: "logout"
 get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
