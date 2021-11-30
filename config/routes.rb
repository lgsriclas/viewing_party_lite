Rails.application.routes.draw do
  root 'landing#index'
  # Users Controller
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  get '/users/:id', to: 'users#show'
end