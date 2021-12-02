Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'

  # Users Controller
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/users/:id/discover', to: 'movies#discover'
  get '/users/:id/movies', to: 'movies#index', as: "user_movies"
  get '/users/:id/movies/:movie_id', to: 'movies#show'

  # Viewing Parties Controller
  get '/users/:id/movies/:id/viewing_party/new', to: 'viewing_parties#new'
  post '/users/:id/movies/:id/viewing_party/new', to: 'viewing_parties#create'
end