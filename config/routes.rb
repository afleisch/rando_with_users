Rando::Application.routes.draw do
  get "sessions/new"
  get "sessions/destroy"
  get "users/new"
  get "users/show"
  get "users/create"
  root to: 'urls#index'

  resources :users, :sessions

  get '/signup', to: 'users#new'

  delete '/signout', to: 'sessions#destroy'

  get '/signin', to: 'sessions#new'
  
  get '/urls', to: 'urls#index'

  get '/urls/new', to: 'urls#new'

  post 'urls/new', to: 'urls#new'

  get 'urls/go/:random_string', to: 'urls#redirect', as: :redirect

  get '/urls/:id/edit', to: 'urls#edit'

  get '/urls/:id', to: 'urls#show'

  post '/urls', to: 'urls#create'

  get '/urls/:id/preview', to: 'urls#preview'

  post '/urls/:id/destroy', to: 'urls#delete'


end
