Rails.application.routes.draw do

  root 'welcome#index'

  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  get '/dashboard', to: "users#show"
  resources :tweets, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :retweets, only: [:create]
  resources :friends, only: [:destroy]
end
