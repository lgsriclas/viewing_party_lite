Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'

  # Users Controller
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/users/:id/discover', to: 'movies#discover'
  get '/users/:id/movies', to: 'movies#index', as: "user_movies"
  get '/users/:id/movies/:movie_id', to: 'movies#show'

  # Parties Controller
  get '/users/:id/movies/:movie_id/party/new', to: 'parties#new'
  post '/users/:id/movies/:movie_id/party/new', to: 'parties#create'
end