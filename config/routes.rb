Rails.application.routes.draw do
  root 'index#index'

  resources :books
  namespace :books do
    post :import, to: 'import#create'
  end

  post '/auth/:provider/', to: 'sessions#new', as: :auth
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
