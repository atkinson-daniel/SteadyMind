Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#index'
  get '/logout', to: 'sessions#destroy'

  get '/stats', to: 'stats#index'

  resources :dashboard, only: [:index, :show]
  resources :mood, only: [:create, :update]
  resources :videos, only: [:index, :show]

  resources :all_resources, only: [:index]

  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
